class AddAmountOfPlayersToCup < ActiveRecord::Migration
  def change
  	add_column :cups, :amount_of_players, :integer, default: 7
  end
end
