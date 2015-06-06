class ShoppingcartsController < ApplicationController

  def index
    @shoppingcarts = Shoppingcart.all
  end

  def show
    @shoppingcart = Shoppingcart.find(params[:id])
  end

  def shoppingcartitem_new
    if session[:current_order_id] == nil
      shoppingcart_status
    end
    @shoppingcartitem = Shoppingcart.find(session[:current_order_id]).shoppingcartitems.build
    @shoppingcartitem = Item.find(params[:item_id]).shoppingcartitems.build

  end

  def shoppingcartitem_create
    @shoppingcartitem = Shoppingcartitem.new(shoppingcartitem_params)
    @shoppingcartitem.shoppingcart = session[:current_order_id].to_i
    @shoppingcartitem.item = params[:item_id].to_i
    if @shoppingcartitem.save
      flash.now[:success] = "You have added item to your shopping cart."
    else
      render :shoppingcartitem_new
    end
    redirect_to shoppingcarts_path
  end

  def checkout
    session.delete(:current_order_id)
    redirect_to shoppingcarts_path
  end


private
  def shoppingcartitem_params
    params.require(:shoppingcartitem).permit(:quantity, :item, :shoppingcart, :unit_price, :subtotal, :created_at, :updated_at)
  end

end
