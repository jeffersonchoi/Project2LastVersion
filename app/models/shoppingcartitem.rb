class Shoppingcartitem < ActiveRecord::Base
  belongs_to :shoppingcart
  belongs_to :item
end
