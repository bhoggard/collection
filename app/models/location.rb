class Location < ActiveRecord::Base
  has_many :works
  validates :name, presence: true, uniqueness: true

  def self.csv_columns
    %w(id name)
  end

  def to_csv
    [id, name]
  end
end
