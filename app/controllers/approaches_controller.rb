class ApproachesController < ApplicationController

  def index
    @approach = Approach.new
    @room = Room.find(params[:room_id])
    @property = Property.find(params[:property_id]) 
  end

  def create
    Approach.create(approach_params)
  end

  private
  def approach_params
    params.require(:approach).permit(:content) #.merge(room_id: params[:room_id]) #user_id: current_user.id
  end

end
