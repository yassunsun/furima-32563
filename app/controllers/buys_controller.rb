class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_buy= UserBuy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      @user_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end