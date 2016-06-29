class AddCountyToLeagues < ActiveRecord::Migration
  def change
    add_reference :leagues, :county, index: true, foreign_key: true
  end
end
