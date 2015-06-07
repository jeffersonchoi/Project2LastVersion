class Item < ActiveRecord::Base
  belongs_to :user
  has_many :shoppingcartitems
  has_many :shoppingcarts, through: :shoppingcartitems
  accepts_nested_attributes_for :shoppingcartitems, :shoppingcarts
end
