class Api::V1::FoodieController < Api::V1::BaseController
  def index
    directions = DirectionService(foodie_params)
    render json: response
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
