class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :resource_id
      t.string :resource_type
      t.references :user, index: true, foreign_key: true
      t.string :text

      t.timestamps null: false
    end
  end
end
