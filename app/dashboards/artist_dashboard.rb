require "administrate/base_dashboard"

class ArtistDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    nationality: Field::BelongsTo,
    works: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    sort_name: Field::String,
    home_page: Field::String,
    birth_year: Field::Number,
    gender: Field::String,
    death_year: Field::Number,
    notes: Field::Text,
    show_large_images: Field::Boolean,
    email: Field::String,
    telephone: Field::String,
    address: Field::Text,
    private_notes: Field::Text,
    missing_information: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :nationality,
    :works,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :nationality,
    :works,
    :id,
    :name,
    :sort_name,
    :home_page,
    :birth_year,
    :gender,
    :death_year,
    :notes,
    :show_large_images,
    :email,
    :telephone,
    :address,
    :private_notes,
    :missing_information,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :nationality,
    :works,
    :name,
    :sort_name,
    :home_page,
    :birth_year,
    :gender,
    :death_year,
    :notes,
    :show_large_images,
    :email,
    :telephone,
    :address,
    :private_notes,
    :missing_information,
  ].freeze

  # Overwrite this method to customize how artists are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(artist)
    artist.name
  end
end
