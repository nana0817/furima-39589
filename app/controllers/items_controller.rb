class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :condition_id, :shipping_fee_id, 
                                 :prefecture_id, :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end
  
end
