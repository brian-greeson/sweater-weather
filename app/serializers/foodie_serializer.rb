class FoodieSerializer

  def initialize(food_trip)
    @data =
    {
      id: "null",
      type: "foodie",
      attributes:
      {
        end_location: city_state(food_trip),
        travel_time: food_trip.travel_time,
        forecast:
        {
          summary: food_trip.forecast.current.description,
          temperature: food_trip.forecast.current.temp
        },
        restaurant:
        {
          name: food_trip.restaurant.name,
          address: food_trip.restaurant.address
        }
      }
    }
  end

  def city_state(food_trip)
    food_trip.end_location.city + ", " + food_trip.end_location.state
  end

end
