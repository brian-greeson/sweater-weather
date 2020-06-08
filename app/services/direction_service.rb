class DirectionService < BaseService
  def self.roadtrip(trip_params)
    DirectionService.new.search(trip_params)
  end

  def search(trip_params)
    response = connection.get("json") do |g|
      g.params['origin'] = trip_params[:start]
      g.params['destination'] = trip_params[:end]
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
