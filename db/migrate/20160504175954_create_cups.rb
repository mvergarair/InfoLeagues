class CreateCups < ActiveRecord::Migration
  def change
    create_table :cups do |t|
      t.references :league, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.integer :day
      t.integer :price
      t.string :prize

      t.timestamps null: false
    end
  end
end
