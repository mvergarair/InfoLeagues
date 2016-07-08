# == Schema Information
#
# Table name: prize_options
#
#  id         :integer          not null, primary key
#  comment    :string
#  prize      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cup_id     :integer
#

class PrizeOption < ActiveRecord::Base

	belongs_to :cup

	
end
