class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to, only: :index
  before_action :set_order,only: [:index, :create]
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address1, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy')
  end

  def move_to
    set_order
    if @item.order || @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
