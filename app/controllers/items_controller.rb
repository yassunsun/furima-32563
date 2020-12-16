class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :fee_id, :prefecture_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
