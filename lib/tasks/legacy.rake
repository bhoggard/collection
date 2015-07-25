require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('pg')

namespace :legacy do
  task import: :environment do
    conn = PG.connect(dbname: 'collection_legacy')
    %w(Nationality Artist Location Category).each do |klass|
      run_import(conn, klass.constantize)
    end
    import_works(conn)
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
  Work.delete_all
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

def transform_work(work)
  work.title = '' if work.title.strip.downcase == 'untitled'
  work.featured = false if work.featured.nil?
end

def get_tags(conn, work)
  sql = "select name from taggings, tags
         where tag_id=tags.id and taggable_id=#{work.id} order by name"
  conn.exec(sql) do |result|
    work.tags = result.map { |i| i['name'] }
  end
end

