require 'activerecord-import/base'
ActiveRecord::Import.require_adapter('pg')

def run_import(conn, klass)
  klass.delete_all
  objects = []
  conn.exec("SELECT * FROM #{klass.table_name}") do |result|
    result.each do |row|
      objects << klass.new(row)
    end
  end
  klass.import objects
end

namespace :legacy do
  task import: :environment do
    conn = PG.connect(dbname: 'collection_legacy')
    %w(Nationality).each do |klass|
      run_import(conn, klass.constantize)
    end
  end
end
