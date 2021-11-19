class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :product_number, :price,
       :rate, :gas_id)
  end

end
