# == Schema Information
#
# Table name: cups
#
#  id                :integer          not null, primary key
#  league_id         :integer
#  location_id       :integer
#  day               :integer
#  prize             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  start_date        :datetime
#  end_date          :datetime
#  amount_of_players :integer          default(7)
#

class Cup < ActiveRecord::Base
  belongs_to :league
  belongs_to :location
  has_many :price_options
  accepts_nested_attributes_for :price_options
  has_attached_file :bases
	validates_attachment_content_type :bases, :content_type => ['application/pdf', 'application/msword', 'text/plain']


  enum day: [:lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :domingo]

  def active?
  	start_date < Time.now and Time.now < end_date + 1.week
  end

	def my_rating
		rating = Rating.where(resource_id: self.id, resource_type: :cup).average(:grade)
		if rating == nil
			rating = 0
		end
		return rating
	end

	def amount_of_ratings
		Rating.where(resource_id: self.id, resource_type: :cup).count
	end

	def has_rated? (current_user)
		Rating.where(resource_id: self.id , resource_type: :cup, user: current_user).first != nil
	end

	def user_rating(current_user)
		Rating.where(resource_id: self.id , resource_type: :cup, user: current_user).first
	end

end