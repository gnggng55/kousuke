class RoomsController < ApplicationController

  def index
    @room = Room.new
    @property = Property.find(params[:property_id])
  end


  def create
    Room.create(room_params)
  end

  private
  def room_params
    params.require(:room).permit(:room_number, :construction_time_id, :instruction, :remarks_room, :construction_detail).merge(property_id: params[:property_id])
  end

  
end
