class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :sort_name, null: false
      t.string :home_page
      t.integer :birth_year
      t.string :gender
      t.integer :death_year
      t.text :notes
      t.boolean :show_large_images
      t.string :email
      t.string :telephone
      t.text :address
      t.text :private_notes
      t.string :missing_information
      t.references :nationality
      t.timestamps null: false
    end
    add_index :artists, :name, unique: true
    add_index :artists, :sort_name
    add_index :artists, :birth_year
    add_index :artists, :missing_information
  end
end
