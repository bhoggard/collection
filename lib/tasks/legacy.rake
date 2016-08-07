require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('pg')
require 'csv'

namespace :legacy do
  task import: :environment do
    conn = PG.connect(dbname: 'collection_legacy')
    %w(Nationality Artist Location Category).each do |klass|
      run_import(conn, klass.constantize)
    end
    import_works(conn)
    run_import(conn, Exhibition)
    import_exhibition_works(conn)
    import_images(conn)
    download_images
  end
end

def run_import(conn, klass)
  return if klass.count > 0
  objects = []
  conn.exec("select * from #{klass.table_name}") do |result|
    result.each do |row|
      transform_row(klass, row)
      objects << klass.new(row)
    end
  end
  klass.import objects
end

# transform row data if needed
def transform_row(klass, row)
  return unless klass == Artist
  row['show_large_images'] = (row.delete('image_permission') == 'yes')
  row.delete('works_count')
end

def import_works(conn)
  return if Work.count > 0
  works = []
  conn.exec("select * from works") do |result|
    result.each do |row|
      work = Work.new(row)
      transform_work(work)
      get_tags(conn, work)
      works << work
    end
  end
  Work.import works
end

def import_exhibition_works(conn)
  ExhibitionWork.delete_all
  works = []
  position = 1
  sql = "select exhibition_id, work_id
         from exhibition_works, works, artists
         where work_id=works.id and artist_id=artists.id
         order by artists.sort_name"
  conn.exec(sql) do |result|
    result.each do |row|
      work = ExhibitionWork.new(row)
      work.position = position
      position += 1
      works << work
    end
  end
  ExhibitionWork.import works
end

def transform_work(work)
  work.title = '' if work.title.strip.downcase == 'unknown'
  work.featured = false if work.featured.nil?
end

def get_tags(conn, work)
  sql = "select name from taggings, tags
         where tag_id=tags.id and taggable_id=#{work.id} order by name"
  conn.exec(sql) do |result|
    work.tags = result.map { |i| i['name'] }
  end
end

def import_images(conn)
  Image.destroy_all
  images = []
  conn.exec("select id, work_id, caption from images") do |result|
    result.each do |row|
      images << Image.new(row)
    end
  end
  Image.import images
end

def download_images
  puts "downloading images..."
  CSV.foreach("#{ENV['HOME']}/Desktop/legacy-images.csv") do |row|
    image = Image.find row.first.to_i
    image.file_remote_url = row.last
    puts image.id
    image.save!
  end
end
