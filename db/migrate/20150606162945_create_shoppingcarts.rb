class CreateShoppingcarts < ActiveRecord::Migration
  def change
    create_table :shoppingcarts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.decimal :total
      t.boolean :order_active

      t.timestamps null: false
    end
  end
end
