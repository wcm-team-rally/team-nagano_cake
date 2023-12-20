class Public::CarItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_car_item, only: [:create, :update, :destroy]

  def index
    @car_items = current_customer.car_items.includes(:item)
  end

  def create
    if @car_item
      new_amount = @car_item.amount + car_item_params[:amount]
      @car_item.update(amount: new_amount)
      redirect_to car_items_path
    else
      @car_item = current_customer.car_items.new(car_item_params)
      @car_item.item_id = @item.id
      if @car_item.save
        redirect_to car_items_path
      else
        render 'public/items/show'
      end
    end
  end

  def update
    @car_item.update(car_item_params) if @car_item
    redirect_to car_items_path
  end

  def destroy
    @car_item.destroy if @car_item
    redirect_to car_items_path
  end

  def destroy_all
    current_customer.car_items.destroy_all
    redirect_to car_items_path
  end

  private

  def car_item_params
    params.require(:car_item).permit(:amount)
  end

  def set_car_item
    @item = Item.find(params[:item_id])
    @car_item = current_customer.has_in_car(@item)
  end
end
