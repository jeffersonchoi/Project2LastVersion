class ShoppingcartsController < ApplicationController

  def index
    @shoppingcarts = Shoppingcart.all
  end

  # def show
  #   @shoppingcart = Shoppingcart.find(params[:id])
  # end

end
