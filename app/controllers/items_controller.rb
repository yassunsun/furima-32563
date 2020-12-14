class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private
  
  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :fee_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
