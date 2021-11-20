class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    Property.create(property_params)
  end

  def show
    @property = Property.find(params[:id])
  end

  def destroy
    property = Property.find(params[:id])
    property.destroy
    redirect_to root_path
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
