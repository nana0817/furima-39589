class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :edit, :destroy]
  before_action :find_item,           only: [:show, :edit, :update, :destroy]
  before_action :are_seller?,         only: [:edit, :destroy]
  before_action :exist_item?,         only: [:edit]

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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def are_seller?
    return unless current_user.id != @item.user_id

    redirect_to root_path
  end

  def exist_item?
    return unless Order.exists?(item_id: @item.id)

    redirect_to root_path
  end

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :condition_id, :shipping_fee_id,
                                 :prefecture_id, :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
