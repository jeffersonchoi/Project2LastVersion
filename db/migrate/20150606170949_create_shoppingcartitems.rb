class CreateShoppingcartitems < ActiveRecord::Migration
  def change
    create_table :shoppingcartitems do |t|
      t.belongs_to :shoppingcart, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :subtotal

      t.timestamps null: false
    end
  end
end
