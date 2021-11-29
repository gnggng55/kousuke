class ItemsController < ApplicationController

  def index
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

  def search
    @items = Item.search(params[:keyword])
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :product_number, :price,
       :rate, :gas_id, :supplier, :maker, images: [])
  end

end
