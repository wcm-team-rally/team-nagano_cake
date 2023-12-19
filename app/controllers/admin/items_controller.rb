class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # @item_pages = Item_page.all.page(params[:page]).per(10)
  end

  def create
  end

  def new
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  # def item_params
  #   params.require(:item).permit(:id, :name, :price, :genre_id, :is_active) #( :body )をpermit内へ追加
  # end

end
