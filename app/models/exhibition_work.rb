class ExhibitionWork < ActiveRecord::Base
  include RankedModel
  belongs_to :exhibition
  belongs_to :work
  ranks :position, with_same: :exhibition_id

  validates :exhibition_id, :work_id, presence: true
end
