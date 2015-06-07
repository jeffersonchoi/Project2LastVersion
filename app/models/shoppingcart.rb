class Shoppingcart < ActiveRecord::Base
  belongs_to :user
  has_many :shoppingcartitems
  has_many :items, through: :shoppingcartitems
  accepts_nested_attributes_for :shoppingcartitems, :items
end
