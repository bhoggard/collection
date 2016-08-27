require "administrate/base_dashboard"

class WorkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artist: Field::BelongsTo,
    category: Field::BelongsTo,
    location: Field::BelongsTo,
    exhibition_works: Field::HasMany,
    exhibitions: Field::HasMany,
    images: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    work_year: Field::Number,
    work_display_date: Field::String,
    dimensions: Field::String,
    medium: Field::Text,
    edition: Field::String,
    acquisition_year: Field::Number,
    description: Field::Text,
    provenance: Field::Text,
    price_paid: Field::Number,
    private_notes: Field::Text,
    missing_information: Field::String,
    market_value: Field::Number,
    market_value_year: Field::Number,
    featured: Field::Boolean,
    image_source: Field::String,
    published: Field::Boolean,
    tags: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :artist,
    :category,
    :work_year,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :artist,
    :category,
    :location,
    :exhibition_works,
    :exhibitions,
    :images,
    :id,
    :title,
    :work_year,
    :work_display_date,
    :dimensions,
    :medium,
    :edition,
    :acquisition_year,
    :description,
    :provenance,
    :price_paid,
    :private_notes,
    :missing_information,
    :market_value,
    :market_value_year,
    :featured,
    :image_source,
    :published,
    :tags,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :artist,
    :category,
    :location,
    :exhibition_works,
    :exhibitions,
    :images,
    :title,
    :work_year,
    :work_display_date,
    :dimensions,
    :medium,
    :edition,
    :acquisition_year,
    :description,
    :provenance,
    :price_paid,
    :private_notes,
    :missing_information,
    :market_value,
    :market_value_year,
    :featured,
    :image_source,
    :published,
    :tags,
  ].freeze

  # Overwrite this method to customize how works are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(work)
    work.title
  end
end
