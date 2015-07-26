class Artist < ActiveRecord::Base
  belongs_to :nationality
  has_many :works, dependent: :destroy
  validates :name, :sort_name, presence: true
end
