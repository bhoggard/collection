class Artist < ActiveRecord::Base
  belongs_to :nationality
  has_many :works, -> { order 'works.work_year, works.title' },
           dependent: :destroy
  validates :name, :sort_name, presence: true

  scope :by_letters, lambda { |letters|
    where('lower(left(sort_name, 1)) in (?)', letters.chars).order(:sort_name)
  }

  scope :featured_works, lambda {
    joins(:artist, :images)
      .where("(select count(id) from images where work_id=works.id) > 0
        and published = true and artists.show_large_images = true")
  }

  scope :featured_works, lambda {
    joins(:artist, :images)
      .where(featured: true, published: true, 'artists.show_large_images': true)
      .group('artists.id, works.id')
      .having('images.count > 0')
  }

  def featured_works
    works.joins(:artist, :images)
      .where("(select count(id) from images where work_id=works.id) > 0
        and published = true and artists.show_large_images = true")

    works.joins(:images).where(featured: true,
                               published: true
                              )
      .group('works.id')
      .having('images.count > 0')
  end

  def works_with_images
    works.joins(:images).where(published: true)
      .group('works.id')
      .having('images.count > 0')
  end

  def featured_work
    works.joins(:artist, :images)
      .where("(select count(id) from images where work_id=works.id) > 0
        and published = true and artists.show_large_images = true")
      .order('featured DESC, acquisition_year DESC, id DESC')
      .first
  end
end
