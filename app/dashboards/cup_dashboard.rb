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
    name: Field::String,
    age: EnumField,
    sex: EnumField,
    time: EnumField,
    price_options: Field::NestedHasMany.with_options(skip: :cup),
    prize_options: Field::NestedHasMany.with_options(skip: :cup),
    amount_of_players: Field::Number,
    amount_of_games: Field::Number,
    # prize: Field::String,
    half_time: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    bases: FileField
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :day,
    :location,
    :amount_of_players,
    :id
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :day,
    :sex,
    :age,
    :time,
    :location,
    :league,
    :id,
    :amount_of_players,
    :amount_of_games,
    :price_options,
    :prize_options,
    :half_time,
    :bases
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :day,
    :location,
    :age,
    :time,
    :sex,
    :half_time,
    :amount_of_players,
    :amount_of_games,
    :price_options,
    :prize_options,
    :league
    # :bases
  ]

  # Overwrite this method to customize how cups are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(cup)
    "Cup #{cup.name}"
  end
end
