class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_index, only: [:index, :create]

  def index
    @user_buy = UserBuy.new
  end

  def create
    @user_buy = UserBuy.new(buy_params)
    if @user_buy.valid?
      pay_item
      @user_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:user_buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_index
    redirect_to root_path if @item.user.id == current_user.id
  end

  def move_index
    redirect_to root_path if user_signed_in? && @item.buy.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
