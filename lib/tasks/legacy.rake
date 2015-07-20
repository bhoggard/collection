namespace :legacy do
  task import: :environment do
    Nationality.delete_all
    conn = PG.connect(dbname: 'collection_legacy')
    conn.exec("SELECT * FROM nationalities") do |result|
      result.each do |row|
        nationality = Nationality.new(name: row['name'])
        nationality.id = row['id']
        nationality.save!
      end
    end
  end
end
