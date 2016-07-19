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
#  amount_of_games    :integer
#  name               :string
#  time               :integer
#  age                :integer          default(0)
#  sex                :integer          default(0)
#

require 'test_helper'

class CupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
