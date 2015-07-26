class Exhibition < ActiveRecord::Base
  validates :title, presence: true
  has_many :exhibition_works
  has_many :works, -> { order "exhibition_works.position" },
           through: :exhibition_works, dependent: :destroy
end
