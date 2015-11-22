class Image < ActiveRecord::Base
  belongs_to :work
  validates :work_id, presence: true
end
