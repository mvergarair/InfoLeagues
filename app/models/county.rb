# == Schema Information
#
# Table name: counties
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  country    :string
#  code       :integer
#  lat        :float
#  lng        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class County < ActiveRecord::Base
	geocoded_by :full_location, :latitude  => :lat, :longitude => :lng
	after_validation :geocode

	validates :name,  presence: true
	validates :city,  presence: true
	validates :country,  presence: true

	def full_location
		"#{name}, #{city}, #{country}"
	end
end
