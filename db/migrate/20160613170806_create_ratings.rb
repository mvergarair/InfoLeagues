class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :resource_type
      t.integer :resource_id
      t.string :resource_attr

      t.timestamps null: false
    end
  end
end
