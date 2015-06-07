module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def shoppingcart_status
    @neworder = Shoppingcart.new
    @neworder.user = current_user
    @neworder.save
    session[:current_order_id] = @neworder.id
    return session[:current_order_id]
  end
end
