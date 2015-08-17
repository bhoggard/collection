class Artist < ActiveRecord::Base
  belongs_to :nationality
  has_many :works, -> { order 'works.work_year, works.title' },
           dependent: :destroy
  validates :name, :sort_name, presence: true
  validates :home_page, format: URI.regexp(%w(http https)), allow_blank: true

  scope :by_letters, lambda { |letters|
    where('lower(left(sort_name, 1)) in (?)', letters.chars).order(:sort_name)
  }

  def featured_work
    works.joins(:artist, :images).includes(:artist, :images)
      .where("(select count(id)
        from images where work_id=works.id) > 0
        and published = true")
      .order('featured DESC, acquisition_year DESC, works.created_at DESC')
      .first
  end
end
