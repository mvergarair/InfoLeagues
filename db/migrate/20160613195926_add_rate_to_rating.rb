class AddRateToRating < ActiveRecord::Migration
  def change
  	add_column :ratings, :rate, :float
  end
end
