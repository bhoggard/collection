class Work < ActiveRecord::Base
  belongs_to :artist
  belongs_to :category
  belongs_to :location
  has_many :exhibition_works, dependent: :destroy
  has_many :exhibitions, through: :exhibition_works
  has_many :images, -> { order(:position) }, dependent: :destroy
  validates :location_id, :artist_id, :category_id, presence: true

  def tags=(tags_list)
    super(tags_list.split(',').map(&:strip).compact.reject(&:blank?))
  end

  filterrific(
    default_filter_params: { sorted_by: 'created_at desc' },
    available_filters: [
      :title,
      :with_location_id,
      :with_category_id,
      :with_artist_sort_name,
      :sorted_by,
      :search_query
    ]
  )

  scope :sorted_by, ->(sort) { order(sort) }
  scope :search_query, ->(term) { where('title ILIKE ?', "%#{term}%") }

  scope :featured_works, lambda {
    joins(:artist)
      .includes(:artist, :images)
      .where("(select count(id) from images where work_id=works.id) > 0
        and featured = true and published = true
        and artists.show_large_images = true")
  }

  scope :visible, -> { where(published: true) }

  scope :recently_updated, lambda {
    includes(:artist, :images)
      .where("(select count(id) from images where work_id=works.id) > 0
        and published = true")
      .order('updated_at DESC')
      .limit(20)
  }

  scope :recently_acquired, lambda {
    includes(:artist, :images)
      .where("(select count(id) from images where work_id=works.id) > 0
        and published = true
        and (extract(year from current_date) - acquisition_year) <= 1")
      .order('acquisition_year DESC, created_at DESC')
      .limit(20)
  }

  def self.csv_columns
    %w(id title artist_id work_year dimensions medium edition 
      acquisition_year description provenance price_paid
      private_notes missing_information location_id category_id
      keywords)
  end

  # for CSV export
  def textilize_without_paragraph(text)
    RedCloth.new(text || '', [:lite_mode]).to_html
  end

  def to_csv
    [id, title, artist.id, work_display_date || work_year,
     dimensions, medium, edition, acquisition_year,
     textilize(description),
     textilize_without_paragraph(provenance),
     price_paid, private_notes, missing_information,
     location.id, category.id, tags.join(',')
    ]
  end
end
