# == Schema Information
#
# Table name: cups
#
#  id                :integer          not null, primary key
#  league_id         :integer
#  location_id       :integer
#  day               :integer
#  price             :integer
#  prize             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  start_date        :datetime
#  end_date          :datetime
#  amount_of_players :integer          default("7")
#

class Cup < ActiveRecord::Base
  belongs_to :league
  belongs_to :location

  enum day: [:lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :domingo]

  def active?
  	start_date < Time.now and Time.now < end_date + 1.week
  end

end
