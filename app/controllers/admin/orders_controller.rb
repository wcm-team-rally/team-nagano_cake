class Admin::OrdersController < ApplicationController
  def show
    
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       @order_details.update_all(making_status: "制作待ち") if @order.status == "confirm_payment"
    end
      redirect_to admin_order_path(@order)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end 
end
