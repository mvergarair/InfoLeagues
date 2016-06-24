require "administrate/base_dashboard"

class LeagueDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    phone: Field::String,
    email: Field::String,
    cups: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    uses_liga_fc: Field::Boolean,
    website_link: Field::String,
    facebook_link: Field::String,
    instagram_link: Field::String,
    twitter_link: Field::String,
    logo: FileField,
    logo_file_name: Field::String,
    logo_content_type: Field::String,
    logo_file_size: Field::Number,
    logo_updated_at: Field::DateTime,
    min_price: Field::Number
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :phone,
    :email,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :phone,
    :email,
    :cups,
    :uses_liga_fc,
    :min_price,
    :logo_file_name
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :phone,
    :email,
    :uses_liga_fc,
    :website_link,
    :facebook_link,
    :instagram_link,
    :twitter_link,
    :logo

  ]

  # Overwrite this method to customize how leagues are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(league)
    "#{league.name}"
  end
end
