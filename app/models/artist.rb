class Artist < ActiveRecord::Base
  belongs_to :nationality
  has_many :works, -> { order 'works.work_year, works.title' },
           dependent: :destroy
  validates :name, :sort_name, presence: true
end
