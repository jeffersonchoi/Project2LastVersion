class ShoppingcartsController < ApplicationController

  def index
    @shoppingcarts = Shoppingcart.all
  end

  def show
    @shoppingcart = Shoppingcart.find(params[:id])
  end

  def shoppingcartitem_new
    @shoppingcartitem = Shoppingcartitem.new
    @shoppingcartitem.item_id = params[:item_id]
    if session[:current_order_id] == nil
      shoppingcart_status
    end
    @shoppingcartitem.shoppingcart_id = session[:current_order_id]
  end

  def shoppingcartitem_create
    @shoppingcartitem = Shoppingcartitem.new(shoppingcartitem_params)
    @shoppingcartitem.item_id = params[:item_id]
    @shoppingcartitem.shoppingcart_id = session[:current_order_id]
    if @shoppingcartitem.save
      flash.now[:success] = "You have added item to your shopping cart."
    else
      render :shoppingcartitem_new
    end
    redirect_to shoppingcarts_path
  end

  def shoppingcartitem_params
    params.require(:shoppingcartitem).permit(:quantity, :item_id, :shoppingcart_id, :unit_price, :subtotal, :created_at, :updated_at)
  end

end
