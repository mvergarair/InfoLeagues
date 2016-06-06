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
#

class Cup < ActiveRecord::Base
  belongs_to :league
  belongs_to :location
  has_many :price_options
  accepts_nested_attributes_for :price_options
  has_attached_file :bases

  enum day: [:lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :domingo]

  def active?
  	start_date < Time.now and Time.now < end_date + 1.week
  end

end
