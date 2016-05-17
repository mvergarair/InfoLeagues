require "administrate/base_dashboard"

class CupDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    league: Field::BelongsTo,
    location: Field::BelongsTo,
    id: Field::Number,
    day: EnumField,
    # day: Field::String.with_options(searchable: true),
    price: Field::Number,
    amount_of_players: Field::Number,
    prize: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :league,
    :location,
    :id,
    :day,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :league,
    :location,
    :id,
    :day,
    :price,
    :prize,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :league,
    :location,
    :day,
    :amount_of_players,
    :price,
    :prize,
  ]

  # Overwrite this method to customize how cups are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(cup)
  #   "Cup ##{cup.id}"
  # end
end
