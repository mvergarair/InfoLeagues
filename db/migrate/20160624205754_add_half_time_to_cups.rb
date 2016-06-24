class AddHalfTimeToCups < ActiveRecord::Migration
  def change
    add_column :cups, :half_time, :integer
  end
end
