class RestaurantService

  def self.one_restaurant(location)
    service = RestaurantService.new
    response = service.search(location)
    Restaurant.new(response[:restaurants][0][:restaurant])
  end


  def search(location)
    response = connection.get("search") do |g|
      g.params['lat'] = location.lat
      g.params['lon'] = location.long
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: "https://developers.zomato.com/api/v2.1") do |conn|
      conn.headers['user-key'] = ENV['ZOMATO']
    end
  end
end
