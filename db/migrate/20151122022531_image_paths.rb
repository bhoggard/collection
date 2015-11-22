class ImagePaths < ActiveRecord::Migration
  def up
    add_column :images, :path, :string
    Image.all.each do |image|
      path = image.file.url(:original, false)
        .sub('https://d1m6cmhgohbb6c.cloudfront.net/', '')
      image.update_attributes!(path: path)
    end
  end

  def down
    remove_column :images, :path
  end
end
