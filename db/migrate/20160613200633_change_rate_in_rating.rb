class ChangeRateInRating < ActiveRecord::Migration
  def change
  	rename_column :ratings, :rate, :grade
  end
end
