# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  resource_type :string
#  resource_id   :integer
#  resource_attr :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  grade         :float
#

class Rating < ActiveRecord::Base
  belongs_to :user
  validates :user, uniqueness: {scope: [:resource_type, :resource_id]}

end
