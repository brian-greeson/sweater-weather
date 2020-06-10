class Trip < ApplicationRecord
  before_create :attributes_from_directions
  validates_presence_of :origin
  validates_presence_of :destination

  belongs_to :user


  def attributes_from_directions
    directions = Directions.new(DirectionsService.road_trip(self))
    self.travel_time = directions.travel_time
    self.origin = directions.origin
    self.destination = directions.destination
    self.arrival_forecast = forecast_at_time_of_arrival(directions).description
  end


  private

  def arrival_time(directions)
    Time.at(directions.travel_time_seconds.seconds.from_now)
  end

  def date_to_hour(time)
    time.strftime("%l %p").strip
  end

  def destination_forecast(directions)
    ForecastService.forecast(Location.new(
      {
        lat: directions.destination_location[:lat],
        long: directions.destination_location[:lng]
      }))
  end

  def forecast_at_time_of_arrival(directions)
    destination_forecast(directions).hourly.select do |forecast|
      forecast.time == date_to_hour(arrival_time(directions))
    end.first
  end

end
