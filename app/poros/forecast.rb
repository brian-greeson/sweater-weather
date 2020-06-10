class Forecast
  attr_accessor :current, :hourly, :daily

  def initialize(forecast_data)
    @current = CurrentConditions.new(forecast_data[:current])
    @hourly = []
    @daily = []
    parse_hourly(forecast_data[:hourly])
    parse_daily(forecast_data[:daily])
  end

  private

  def parse_hourly(hourly_data)
    24.times do |i|
      @hourly << HourlyConditions.new(hourly_data[i])
    end
  end

  def parse_daily(daily_data)
    daily_data.each do |weather_data|
      @daily << DailyConditions.new(weather_data)
    end
  end

end
