class RoomsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @room = Room.new
    @property = Property.find(params[:property_id])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to property_path(@room.property_id)
    else
      render property_rooms_path(@room.id[])
    end
  end

  def show
    @room = Room.find(params[:id])
    @property = Property.find(params[:property_id])
    @approaches = Approach.where(id: params[:id])
    @approach = Approach.where(room_id: params[:id]) 
  end

  def destroy
    @property = Property.find(params[:property_id])
    room = Room.find(params[:id])
    room.destroy
    redirect_to property_path(@property.id)
  end 

  def edit
    @property = Property.find(params[:property_id])
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to property_room_path(@room.property_id,@room.id)
    else
      render :edit
    end
  end

  private
  def room_params
    params.require(:room).permit(:room_number, :construction_time_id, :instruction, :remarks_room, :construction_detail).merge(property_id: params[:property_id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
