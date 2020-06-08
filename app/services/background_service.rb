class BackgroundService
  def location_background(location)
    response = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json") do |g|
      g.params['key'] = ENV['GOOGLE_KEY']
      g.params['place_id'] = location.place_id
    end

    place_details = JSON.parse(response.body, symbolize_names: true)
    reference = place_details[:result][:photos][0][:photo_reference]

    response = Faraday.get("https://maps.googleapis.com/maps/api/place/photo") do |g|
      g.params['key'] = ENV['GOOGLE_KEY']
      g.params['photoreference'] = reference
      g.params['maxwidth'] = 400
    end
    
    response.headers["location"]
  end

end
