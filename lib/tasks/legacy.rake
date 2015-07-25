require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('pg')

def run_import(conn, klass)
  return if klass.count > 0
  objects = []
  conn.exec("SELECT * FROM #{klass.table_name}") do |result|
    result.each do |row|
      transform(klass, row)
      objects << klass.new(row)
    end
  end
  klass.import objects
end

# transform data if needed
def transform(klass, row)
  return unless klass == Artist
  row['show_large_images'] = (row.delete('image_permission') == 'yes')
  row.delete('works_count')
end

namespace :legacy do
  task import: :environment do
    conn = PG.connect(dbname: 'collection_legacy')
    %w(Nationality Artist Location).each do |klass|
      run_import(conn, klass.constantize)
    end
  end
end
