class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end

  def edit
  end

  def update
  end

  def search
    @items = Item.search(params[:keyword])
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :product_number, :price,
       :rate, :gas_id, :supplier, :maker, images: [])
  end

end
