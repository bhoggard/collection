class Work < ActiveRecord::Base
  belongs_to :artist
  belongs_to :category
  belongs_to :location
  has_many :exhibition_works, dependent: :destroy
  has_many :exhibitions, through: :exhibition_works
  has_many :images, dependent: :destroy
  validates :location_id, :artist_id, :category_id, presence: true

  scope :featured_works, lambda {
    joins(:artist, :images)
      .where("featured = ? and published = ? and artists.show_large_images = ?",
             true, true, true)
  }
end
