class AddMinPriceToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :min_price, :integer
  end
end
