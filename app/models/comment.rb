# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  resource_id   :integer
#  resource_type :string
#  user_id       :integer
#  text          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :user
  validates :user, uniqueness: {scope: [:resource_type, :resource_id]}

end
