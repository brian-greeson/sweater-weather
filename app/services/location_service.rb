class LocationService
  def self.geocode(forecast_params)
    service = LocationService.new
    json = JSON.parse(service.search(forecast_params[:location]).body, symbolize_names: true)
    Location.new(json)
  end

  def search(query)
    conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.params['key'] = ENV['GOOGLE_KEY']
    end

    conn.get '' do |c|
      c.params['address'] = query
    end
  end

end
