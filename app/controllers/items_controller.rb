class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]
  before_action :move_to, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :text, :category_id, :item_condition_id, :delivery_charge_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
