class Image < ActiveRecord::Base
  belongs_to :work
  validates :work_id, presence: true
  has_attached_file :file,
                    default_url: "pixel.gif",
                    url: "/images/:hash.:extension",
                    hash_secret: Rails.application.secrets.image_secret,
                    styles: {
                      large: "800x800>",
                      thumb: "200x200>"
                    }
  validates_attachment_content_type :file, content_type: %r{\Aimage\/.*\Z}
  attr_reader :file_remote_url

  def file_remote_url=(url_value)
    self.file = URI.parse(url_value)
    @file_remote_url = url_value
  end
end
