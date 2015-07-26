class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :work, index: true, foreign_key: true, null: false
      t.string :caption
      t.timestamps null: false
    end
  end
end
