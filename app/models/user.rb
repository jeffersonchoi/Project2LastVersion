class User < ActiveRecord::Base
  has_secure_password
  has_many :items
  has_many :shoppingcarts
  accepts_nested_attributes_for :shoppingcarts, :items
end
