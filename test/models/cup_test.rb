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

require 'test_helper'

class CupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
