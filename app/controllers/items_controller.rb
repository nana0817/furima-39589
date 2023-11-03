class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_item, only: [:show, :edit]
  before_action :are_seller, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def are_seller
    return unless current_user.id != @item.user_id

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :condition_id, :shipping_fee_id,
                                 :prefecture_id, :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
