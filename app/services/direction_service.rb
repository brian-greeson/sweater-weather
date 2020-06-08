class DirectionService
 def roadtrip(trip_params)
  response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json") do |g|
     g.params['key'] = ENV['GOOGLE_KEY']
     g.params['origin'] = trip_params[:start]
     g.params['destination'] = trip_params[:end]
   end
end
