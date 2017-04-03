class Location < ActiveRecord::Base
  has_many :works
  validates :name, presence: true, uniqueness: true

  def self.csv_columns
    %w(name)
  end

  def to_csv
    [name]
  end
end
