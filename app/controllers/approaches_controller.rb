class ApproachesController < ApplicationController

  def index
    @approach = Approach.new
    @room = Room.find(params[:room_id])
    @property = Property.find(params[:property_id]) 
  end

  def create
    @room = Room.find(params[:room_id])
    @approach = Approach.create(approach_params)
    if @approach.save
      redirect_to property_room_path(@room.property_id, @room.id)
    else
      render action: :index
    end
  end

  private
  def approach_params
    params.require(:approach).permit(:content) .merge(room_id: params[:room_id], user_id: current_user.id)
  end

end
