class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title, null: false, default: ""
      t.references :artist, index: true, foreign_key: true, null: false
      t.integer :work_year
      t.string :work_display_date
      t.string :dimensions
      t.text :medium
      t.string :edition
      t.integer :acquisition_year
      t.text :description
      t.text :provenance
      t.integer :price_paid
      t.text :private_notes
      t.string :missing_information
      t.integer :market_value
      t.integer :market_value_year
      t.references :location, index: true, foreign_key: true, null: false
      t.references :category, index: true, foreign_key: true, null: false
      t.boolean :featured, null: false, default: false
      t.string :image_source
      t.boolean :published, null: false, default: true
      t.string :tags, array: true, default: []
      t.timestamps null: false
    end
    add_index :works, :title
    add_index :works, :work_year
    add_index :works, :published
    add_index :works, :featured
    add_index :works, :tags, using: :gin
  end
end
