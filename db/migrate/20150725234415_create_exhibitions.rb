class CreateExhibitions < ActiveRecord::Migration
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end

    add_index :exhibitions, :start_date
    add_index :exhibitions, :end_date

    create_table :exhibition_works, id: false do |t|
      t.references :exhibition, index: true, foreign_key: true, null: false
      t.references :work, index: true, foreign_key: true, null: false
      t.integer :position, null: false
    end
    add_index :exhibition_works, [:exhibition_id, :work_id], unique: true
    add_index :exhibition_works, :position, unique: true
  end
end
