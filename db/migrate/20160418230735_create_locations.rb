class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :lng
      t.string :phone
      t.string :email
      t.references :county, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
