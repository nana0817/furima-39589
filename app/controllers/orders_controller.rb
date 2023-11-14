class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, 
                                          :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], 
                                                                     token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id]).price,  # 商品の値段
      card: order_params[:token],                       # カードトークン
      currency: 'jpy'                                   # 通貨の種類（日本円）
    )
  end

end