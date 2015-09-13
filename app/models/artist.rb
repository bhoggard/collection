class Artist < ActiveRecord::Base
  belongs_to :nationality
  has_many :works, -> { order 'work_year, title' },
           dependent: :destroy
  validates :name, :sort_name, presence: true
  validates :home_page, format: URI.regexp(%w(http https)), allow_blank: true

  # gender info for select
  GENDER_OPTIONS = ['female', 'male', 'ftm transgender', 'mtf transgender',
                    'other']

  filterrific(
    default_filter_params: { sorted_by: 'sort_name' },
    available_filters: [
      :sorted_by,
      :search_query
    ]
  )

  scope :by_letters, lambda { |letters|
    where('lower(left(sort_name, 1)) in (?)', letters.chars).order(:sort_name)
  }

  scope :sorted_by, ->(sort) { order(sort) }
  scope :search_query, ->(term) { where('name ILIKE ?', "%#{term}%") }

  def featured_work
    works.joins(:artist, :images).includes(:artist, :images)
      .where("(select count(id)
        from images where work_id=works.id) > 0
        and published = true")
      .order('featured DESC, acquisition_year DESC, works.created_at DESC')
      .first
  end
end
