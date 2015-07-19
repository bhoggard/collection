class CreateNationalities < ActiveRecord::Migration
  def change
    create_table :nationalities do |t|
      t.string :name
    end
    add_index :nationalities, :name, unique: true
  end
end
