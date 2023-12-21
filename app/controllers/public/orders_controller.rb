class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :caritem_nill, only: [:new, :create]
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customer_id = current_customer.id
    end
      @car_items = current_custemer.car_items
      @order_new = Order.new
      render :confirm
  end

  def thanks
  end

  def create
    order = Order.new(order_params)
    order.save
    @car_items = current_customer.car_items.all
    
    @car_items.each do |car_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = car_item.item.id
      @order_details.price = car_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.making_status = 0
      @order_details.save!
     end
    
    CarItem.destroy_all
    redirect_to orders_thanks_path
  end

  def index
  end

  def show
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment, :customer_id , :status)
  end
  
  def caritem_nill
    car_items = current_customer.car_items
    if car_items.blank?
      redirect_to car_items_path
    end
  end
end
