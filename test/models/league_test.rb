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
#  uses_liga_fc      :boolean          default(FALSE)
#  min_price         :integer
#  county_id         :integer
#

require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
