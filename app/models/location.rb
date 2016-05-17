# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  lat        :float
#  lng        :float
#  phone      :string
#  email      :string
#  county_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  belongs_to :county

  geocoded_by :full_address, :latitude  => :lat, :longitude => :lng
  after_validation :geocode

	validates :name,  presence: true
  validates :county, presence: true

  def full_address
    "#{address}, #{self.county.full_location}"
  end
end
