class LocationService
  def self.geocode(query)
    service = LocationService.new
    json = JSON.parse(service.search(query).body, symbolize_names: true)
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
