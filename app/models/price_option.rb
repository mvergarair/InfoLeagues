# == Schema Information
#
# Table name: price_options
#
#  id                   :integer          not null, primary key
#  comment              :string
#  price                :integer
#  preinscription_price :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  cup_id               :integer
#

class PriceOption < ActiveRecord::Base
  belongs_to :cup

	def self.max_price
    PriceOption.maximum(:price)    
  end
end
