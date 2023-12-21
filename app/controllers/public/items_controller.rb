class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    #@items = Item.all
  end

  def show
    @item = Item.find(params[:id])

  end


end
