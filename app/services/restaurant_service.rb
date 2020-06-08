class RestaurantService

  def self.one_restaurant(location)
    service = RestaurantService.new
    response = service.search(location)
    Restaurant.new(response[:restaurants][0][:restaurant])
  end


  def search(location)
    response = Faraday.get("https://developers.zomato.com/api/v2.1/search") do |g|
      g.headers['user-key'] = ENV['ZOMATO']
      g.params['lat'] = location.lat
      g.params['lon'] = location.long
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  
end
