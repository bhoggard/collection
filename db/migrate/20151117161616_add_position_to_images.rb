class AddPositionToImages < ActiveRecord::Migration
  # we rarely have more than 1 images, so no index for now
  def change
    add_column :images, :position, :integer
  end
end
