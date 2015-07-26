class Nationality < ActiveRecord::Base
  has_many :artists
  validates :name, presence: true, uniqueness: true
end
