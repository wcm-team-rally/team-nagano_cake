class Public::CarItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @car_items = CarItem.all
    @item = Item.all
    @total = @car_items.inject(0) { |sum, car_item| sum + car_item.subtotal }

  end

  def create
    if current_customer.car_items.find_by(item_id: params[:car_item][:item_id]).present?
      @car_item = current_customer.car_items.find_by(item_id: params[:car_item][:item_id])
      @car_item.amount += params[:car_item][:amount].to_i
      @car_item.save
        flash[:notice] = 'カートに商品が入りました。'
        redirect_to car_items_path
    else
      @car_item = CarItem.new(car_item_params)
      @car_item.amount = params[:car_item][:amount].to_i
      @car_item.customer_id=current_customer.id
      if @car_item.save
          flash[:notice] = 'カートに商品が入りました。'
          redirect_to car_items_path
      else
        flash[:alert] = '商品の追加に失敗しました。'
          redirect_to items_path
      end
    end
  end

  def update
    @car_item = CarItem.find(params[:id])
		@car_item.update(car_item_params)
		redirect_to car_items_path
  end

  def destroy
    @car_item = CarItem.find(params[:id])
    @car_item.destroy
    @car_items = CarItem.all
    render 'index'
  end

  def destroy_all
    @car_items = CarItem.all
    current_customer.car_items.destroy_all
    render 'index'
  end

  private

  def car_item_params
    params.require(:car_item).permit(:item_id, :amount, :customer_id)
  end
end
