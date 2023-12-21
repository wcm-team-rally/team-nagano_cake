class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    #@items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @car_item = CarItem.all
  end
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :customer_id, :item_id)
  end
end
