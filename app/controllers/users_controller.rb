class UsersController < ApplicationController

  def user_item_index
    @user = User.find(params[:id])
    @items = @user.items
  end

  def user_item_show
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])
  end

  def user_item_new
    @item = User.find(current_user).items.build
  end

  def user_item_create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to users_path
    else
      render :user_item_new
    end
  end




  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
   @user = User.find(current_user)
  end

  def update
   @user = User.find(current_user)

   if @user.update_attributes(user_params)
     redirect_to users_path
   else
     render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :password, :password_confirmation)
  end

  def item_params
    params.require(:item).permit(:item_name, :user_id, :orderline_id, :stock_quantity, :item_price, :item_active, :created_at, :updated_at)
  end

end
