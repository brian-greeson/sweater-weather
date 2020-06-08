class FoodTrip
  attr_accessor :data

  def initialize
    @data = {
        id: "null",
        type: "foodie",
        attributes: {
          end_location: nil,
          travel_time: nil,
          forecast: {
            summary: nil,
            temperature: nil
          },
          restaurant: {
            name: nil,
            address: nil
          }
        }
      }

  end
end
