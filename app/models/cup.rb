# == Schema Information
#
# Table name: cups
#
#  id                 :integer          not null, primary key
#  league_id          :integer
#  location_id        :integer
#  day                :integer
#  prize              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  start_date         :datetime
#  end_date           :datetime
#  amount_of_players  :integer          default(7)
#  bases_file_name    :string
#  bases_content_type :string
#  bases_file_size    :integer
#  bases_updated_at   :datetime
#  half_time          :integer
#

class Cup < ActiveRecord::Base

  
	after_save :update_min_price, :update_league_county
  belongs_to :league
  belongs_to :location
  has_many :price_options
  has_many :prize_options
  accepts_nested_attributes_for :price_options
  accepts_nested_attributes_for :prize_options
  has_attached_file :bases
	validates_attachment_content_type :bases, :content_type => ['application/pdf', 'application/msword', 'text/plain']


  enum day: [:lunes, :martes, :miercoles, :jueves, :viernes, :sábado, :domingo]

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

	def min_price
		self.price_options.minimum(:price)
	end

	def update_min_price
		self.league.update(min_price: self.price_options.minimum(:price))
	end

	def price_to_show
		if self.price_options.count > 0
			if self.price_options.where(comment: 'Equipo Nuevo').count > 0
				self.price_options.where(comment: 'Equipo Nuevo').first.price
			end
		end
		return "N/A"
	end

	def update_league_county
		self.league.update(county: self.location.county)
	end
end
