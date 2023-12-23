class Admin::ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.page(params[:page])
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
    # @item.is_active = params[:item][:is_active]
    # @item.name = params[:item][:name]
    # @item.price = params[:item][:price]
    # @item.introduction = params[:item][:introduction]
    # @item.genre_id = params[:item][:genre_id]
    # redirect_to edit_admin_item_path(@item.id)
    if @item.update(item_params)
      #@item.is_active = params[:item][:is_active]
      redirect_to edit_admin_item_path(@item.id)
    else
      redirect_to edit_admin_item_path(@item.id)
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active, :image) #( :body )をpermit内へ追加
  end

end
