class Artist < ActiveRecord::Base
  belongs_to :nationality
  validates :name, :sort_name, presence: true
end
