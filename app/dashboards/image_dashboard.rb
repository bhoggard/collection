require "administrate/base_dashboard"

class ImageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    work: Field::BelongsTo,
    id: Field::Number,
    caption: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    file_file_name: Field::String,
    file_content_type: Field::String,
    file_file_size: Field::Number,
    file_updated_at: Field::DateTime,
    position: Field::Number,
    path: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :work,
    :id,
    :caption,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :work,
    :id,
    :caption,
    :created_at,
    :updated_at,
    :file_file_name,
    :file_content_type,
    :file_file_size,
    :file_updated_at,
    :position,
    :path,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :work,
    :caption,
    :file_file_name,
    :file_content_type,
    :file_file_size,
    :file_updated_at,
    :position,
    :path,
  ].freeze

  # Overwrite this method to customize how images are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(image)
  #   "Image ##{image.id}"
  # end
end
