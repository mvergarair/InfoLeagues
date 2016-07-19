class CreatePrizeOptions < ActiveRecord::Migration
  def change
    create_table :prize_options do |t|
      t.string :comment
      t.string :prize

      t.timestamps null: false
    end
  end
end
