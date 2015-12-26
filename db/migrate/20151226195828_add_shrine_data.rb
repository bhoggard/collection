class AddShrineData < ActiveRecord::Migration
  def change
    add_column :images, :file_data, :json
  end
end
