class PropertiesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
      if @property.save
        redirect_to property_path(@property.id)
      else
        render :new
      end
  end

  def show
    @property = Property.find(params[:id])
    @rooms = Room.where(property_id: params[:id])
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
