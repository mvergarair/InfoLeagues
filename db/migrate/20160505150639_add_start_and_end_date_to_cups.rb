class AddStartAndEndDateToCups < ActiveRecord::Migration
  def change
  	add_column :cups, :start_date, :datetime
  	add_column :cups, :end_date, :datetime
  end
end
