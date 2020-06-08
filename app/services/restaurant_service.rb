class RestaurantService < BaseService

  def self.one_restaurant(location)
    response = RestaurantService.new.search(location)
    Restaurant.new(response[:restaurants][0][:restaurant])
  end

  def search(location)
    response = connection.get("search") do |g|
      g.params['lat'] = location.lat
      g.params['lon'] = location.long
    end
    parsed_response(response)
  end

  private

  def connection
    Faraday.new(url: "https://developers.zomato.com/api/v2.1") do |conn|
      conn.headers['user-key'] = ENV['ZOMATO']
    end
  end
end
