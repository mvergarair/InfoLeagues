class CreatePriceOptions < ActiveRecord::Migration
  def change
    create_table :price_options do |t|
    	t.references :cup, index: true, foreign_key: true
    	t.string :comment
    	t.integer :price
    	t.integer :preinscription_price
    end
  end
end
