class DirectionsService < BaseService
  def self.road_trip(trip)
    DirectionsService.new.search(trip)
  end

  def search(trip)
    response = connection.get("json") do |g|
      g.params['origin'] = trip.origin
      g.params['destination'] = trip.destination
    end
    parsed_response(response)
  end

  private

  def connection
    Faraday.new(url: "https://maps.googleapis.com/maps/api/directions") do |conn|
     conn.params['key'] = ENV['GOOGLE_KEY']
    end
  end

end
