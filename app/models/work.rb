class Work < ActiveRecord::Base
  belongs_to :artist
  belongs_to :category
  belongs_to :location
  has_many :exhibition_works
  has_many :exhibitions, through: :exhibition_works
  validates :location_id, :artist_id, :category_id, presence: true
end
