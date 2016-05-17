# == Schema Information
#
# Table name: counties
#
#  id         :integer          not null, primary key
#  name       :string
#  city       :string
#  country    :string
#  code       :integer
#  lat        :float
#  lng        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CountyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
