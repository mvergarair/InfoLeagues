# == Schema Information
#
# Table name: leagues
#
#  id                :integer          not null, primary key
#  name              :string
#  phone             :string
#  email             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  logo_file_name    :string
#  logo_content_type :string
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#  website_link      :string
#  facebook_link     :string
#  instagram_link    :string
#  twitter_link      :string
#  uses_liga_fc      :boolean          default("f")
#

class League < ActiveRecord::Base

	has_attached_file :logo
	validates_attachment_content_type :logo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :cups

	def logo_url
		self.logo.url
	end

	def days_played
		self.cups.pluck(:day).sort
	end

	def amount_of_players
		self.cups.group(:amount_of_players).pluck(:amount_of_players)
	end

	def location
		self.cups.first.location.name
	end
end
