class Api::V1::FoodieController < Api::V1::BaseController
  def index
    food_trip = FoodTrip.new
    directions = DirectionService.roadtrip(foodie_params)
    duration = directions[:routes][0][:legs][0][:duration][:text]
    # arrival_time = TODO
    end_location = LocationService.geocode({location: foodie_params[:end]})
    end_forecast = ForecastService.forecast(end_location)
    food_trip = {}
    food_trip[:data] = {}
    food_trip[:data][:]
    binding.pry
    food_trip[:data][:attributes][:end_location] = directions[:routes][0][:legs][0][:end_address]
    food_trip[:data][:attributes][:travel_time] = duration
    food_trip[:data][:attributes][:forecast][:summary] = end_forecast.current.description
    food_trip[:data][:attributes][:forecast][:temperature] = end_forecast.current.temp
    food_trip[:data][:attributes][:restaurant][:name]
    food_trip[:data][:attributes][:restaurant][:address]
    render json: food_trip
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
