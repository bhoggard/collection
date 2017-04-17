require 'csv'

namespace :export do
  desc "Export all data to CSV files"
  task data: :environment do
    [Artist, Location, Work].each do |model|
      puts "exporting #{model}"
      CSV.open("tmp/#{model.to_s.downcase.pluralize}.csv", "wb") do |csv|
        csv << model.csv_columns.map(&:upcase)
        model.find_each do |item|
          csv << item.to_csv.map { |x| trim(x) }
        end
      end
    end
  end
end

def trim(s)
  s ||= ''
  s.to_s.strip
end
