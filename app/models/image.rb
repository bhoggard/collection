class Image < ActiveRecord::Base
  include ImageUploader[:file]
  belongs_to :work
  validates :work_id, presence: true
end
