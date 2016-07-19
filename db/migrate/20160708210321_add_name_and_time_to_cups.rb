class AddNameAndTimeToCups < ActiveRecord::Migration
  def change
    add_column :cups, :name, :string
    add_column :cups, :time, :integer
    add_column :cups, :age, :integer
    add_column :cups, :sex, :integer
  end
end
