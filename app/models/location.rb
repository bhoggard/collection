class Location < ActiveRecord::Base
  has_many :works
  validates :name, presence: true, uniqueness: true
end
