class Api::V1::FoodieController < Api::V1::BaseController
  def index
    directions = DirectionService.roadtrip(foodie_params)
    duration = directions[:routes][0][:legs][0][:duration][:text]
    # arrival_time = TODO
    forcast = LocationService.geocode()
binding.pry
    food_trip = {}
    food_trip[:data] = {}
    binding.pry
    food_trip[:data][:attributes][:end_location] = directions[:routes][0][:legs][0][:end_address]
    food_trip[:data][:attributes][:travel_time] = duration
    render json: food_trip
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
