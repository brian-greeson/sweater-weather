class Api::V1::FoodieController < Api::V1::BaseController
  def index
    food_trip = FoodTrip.new
    directions = DirectionService.roadtrip(foodie_params)
    food_trip.end_location = LocationService.geocode({location: foodie_params[:end]})
    food_trip.forecast = ForecastService.forecast(food_trip.end_location)
    food_trip.restaurant = RestaurantService.one_restaurant(food_trip.end_location)
    food_trip.travel_time = directions[:routes][0][:legs][0][:duration][:text]

    render json: FoodieSerializer.new(food_trip).to_json
  end

  private

  def foodie_params
    params.permit(:start, :end, :search)
  end
end
