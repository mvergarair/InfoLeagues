class AddCupIdToPrizeOptions < ActiveRecord::Migration
  def change
    add_reference :prize_options, :cup, index: true, foreign_key: true
  end
end
