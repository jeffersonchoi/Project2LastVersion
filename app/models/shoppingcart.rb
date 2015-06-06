class Shoppingcart < ActiveRecord::Base
  belongs_to :user
  has_many :shoppingcartitems
end
