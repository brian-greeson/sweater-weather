class Api::V1::FoodieController < Api::V1::BaseController
  def index
    food_trip = FoodTrip.new
    directions = DirectionService.roadtrip(foodie_params)
    duration = directions[:routes][0][:legs][0][:duration][:text]
    # arrival_time = TODO

    food_trip.end_location = LocationService.geocode({location: foodie_params[:end]})
    food_trip.forecast = ForecastService.forecast(food_trip.end_location)
    food_trip.restaurant = RestaurantService.one_restaurant(food_trip.end_location)
binding.pry
    food_trip.data[:attributes][:end_location] = directions[:routes][0][:legs][0][:end_address]
    food_trip.data[:attributes][:travel_time] = duration

    food_trip.data[:attributes][:forecast][:summary] = end_forecast.current.description
    food_trip.data[:attributes][:forecast][:temperature] = end_forecast.current.temp

    food_trip.data[:attributes][:restaurant][:name] = end_resturant[:restaurants][0][:restaurant][:name]
    food_trip.data[:attributes][:restaurant][:address] = end_resturant[:restaurants][0][:restaurant][:location][:address]
    render json: food_trip.to_json
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
