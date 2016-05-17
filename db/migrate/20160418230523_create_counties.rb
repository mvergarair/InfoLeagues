class CreateCounties < ActiveRecord::Migration
  def change
    create_table :counties do |t|
      t.string :name
      t.string :city
      t.string :country
      t.integer :code
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
