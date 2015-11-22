class Image < ActiveRecord::Base
  belongs_to :work
  validates :work_id, presence: true
  has_attached_file :file,
                    storage: :s3,
                    path: "/images/:hash.:extension",
                    hash_secret: Rails.application.secrets.image_secret,
                    styles: {
                      large: "800x800>",
                      thumb: "200x200>"
                    },
                    s3_credentials: {
                      bucket: ENV["AWS_S3_BUCKET"],
                      access_key_id: ENV["AWS_ID"],
                      secret_access_key: ENV["AWS_SECRET"]
                    },
                    s3_permissions: { original: :private },
                    s3_headers: { 'Expires' => 1.year.from_now.httpdate },
                    s3_host_alias: Rails.application.secrets.cdn_url,
                    s3_protocol: 'https',
                    url: ":s3_alias_url",
                    convert_options: {
                      all: "-quality 100 -strip"
                    }

  validates_attachment_content_type :file, content_type: %r{\Aimage\/.*\Z}
  attr_reader :file_remote_url

  def file_remote_url=(url_value)
    self.file = URI.parse(url_value)
    @file_remote_url = url_value
  end
end
