class Nationality < ActiveRecord::Base
  validates :name, presence: true
end
