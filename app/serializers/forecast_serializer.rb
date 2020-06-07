class ForecastSerializer
  attr_reader :current
  def self.injest(forecast_data)
    forecast = Forecast.new
    forecast.current = WeatherConditions.new(forecast_data[:current])
    forecast
  end


end
