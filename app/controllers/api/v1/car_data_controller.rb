class Api::V1::CarDataController < ApplicationController
  def create
    data = CarData.new(car_data_params.merge(user: current_user))
    
    if data.save
      head :ok
    else
      render json: { error: data.errors.full_messages }
    end
  end

  def index
    debugger
    collection = current_user.car_data
    render json: { entries: collection }
    debugger
  end

  private

  def car_data_params
    params.require(:car_data).permit!
  end
end

# def car_data_params
#   params.permit post: [:regnum, :ordernum, :make, :model, :year, :color, :mileage]
# end
