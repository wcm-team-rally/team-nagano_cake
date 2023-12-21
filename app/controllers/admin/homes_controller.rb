class Admin::HomesController < ApplicationController
  def top
    @order = current_customer.orders
  end
end
