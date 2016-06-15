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

require 'test_helper'

class PriceOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
