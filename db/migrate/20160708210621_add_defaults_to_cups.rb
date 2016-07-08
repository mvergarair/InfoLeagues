class AddDefaultsToCups < ActiveRecord::Migration
  def change
  	change_column :cups, :sex, :integer, default: 0
  	change_column :cups, :age, :integer, default: 0
  end
end
