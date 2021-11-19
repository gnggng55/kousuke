class PropertiesController < ApplicationController

  def index
  end

  def new
    @property = Property.new
  end

  def create
    Property.create(property_params)
  end

  def search
    @properties = Property.search(params[:keyword])
  end

  private
  def property_params
    params.require(:property).permit(:property_name, :address, :existing_information,
       :new_information, :remarks, :parking_id, :gas_id, :image)
  end
end
