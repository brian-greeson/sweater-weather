require 'rails_helper'

RSpec.describe "foodie serializer" do
  it "serializes a food trip" do
    location_json = File.read("./fixtures/location.json")


    food_trip = FoodTrip.new
    food_trip.end_location = Location.new(location_json)
    food_trip.travel_time = 
    food_trip.forecast
    food_trip.restaurant
  end

end
