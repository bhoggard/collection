class Work < ActiveRecord::Base
  belongs_to :artist
  belongs_to :category
  belongs_to :location
  validates :location_id, :artist_id, :category_id, presence: true
end
