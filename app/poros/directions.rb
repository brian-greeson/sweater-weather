class Directions
  attr_reader :travel_time, :travel_time_seconds, :origin, :origin_location, :destination, :destination_location
  def initialize(directions)
    @origin = directions[:routes][0][:legs][0][:start_address]
    @origin_location = directions[:routes][0][:legs][0][:start_location]
    @destination = directions[:routes][0][:legs][0][:end_address]
    @destination_location = directions[:routes][0][:legs][0][:end_location]
    @travel_time = directions[:routes][0][:legs][0][:duration][:text]
    @travel_time_seconds = directions[:routes][0][:legs][0][:duration][:value]
  end
end
