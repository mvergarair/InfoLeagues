class AddAmountOfGamesToCups < ActiveRecord::Migration
  def change
    add_column :cups, :amount_of_games, :integer
  end
end
