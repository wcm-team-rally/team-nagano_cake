class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    # @order_details.update(order_details_params)

    is_updated = true
      if @order_details.update(order_detail_params)
         @order.update(status: "manufacturing") if @order_details.making_status == "manufacturing"
         @order_details.each do |order_details|
           if order_details.making_status != "finish"
             is_update = false
           end
         end
         @order.update(status: "preparing_ship")
      end
        redirect_to admin_order_path(@order)
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:making_status)
  end
end
