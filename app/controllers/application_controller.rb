class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def shoppingcart_status
    @neworder = Shoppingcart.new
    @neworder.user_id = current_user
    @neworder.save
    session[:current_order_id] = @neworder.id.to_s
    return session[:current_order_id]
  end

end
