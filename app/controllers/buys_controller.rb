class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy= Buy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = UserItem.new(buy_params)
    if @buy.valid?
      @buy.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end