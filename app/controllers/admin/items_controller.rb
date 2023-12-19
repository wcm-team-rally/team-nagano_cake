class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # @item_pages = Item_page.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      redirect_to edit_admin_item_path(item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :name, :introduction, :price, :genre_id, :is_active, :image) #( :body )をpermit内へ追加
  end

end
