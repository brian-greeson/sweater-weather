class ForecastService
  def self.forecast(location)
    service = ForecastService.new()
    forecast_json = service.one_call(location).body
    forecast_data = JSON.parse(forecast_json, symbolize_names: true)
    ForecastSerializer.injest(forecast_data)
  end

  def one_call(location)
    connection.get('onecall') do |g|
      g.params['lat'] = location.lat
      g.params['lon'] = location.long
      g.params['exclude'] = 'minutely'
    end
  end

  private

  def connection
    Faraday.new(url: "https://api.openweathermap.org/data/2.5") do |conn|
      conn.params['appid'] = ENV['OPEN_WEATHER_KEY']
    end
  end


end
