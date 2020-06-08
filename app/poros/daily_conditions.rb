class DailyConditions < WeatherConditions
  attr_reader :day, :sunrise, :sunset, :temp, :temp_high, :temp_low, :feels_like, :pressure, :humidity, :dew_point, :clouds, :wind_speed, :wind_deg, :icon
  def initialize(weather_data)
    @day = time_to_day(Time.strptime(weather_data[:dt].to_s,'%s'))
    @sunrise = time_to_12hr(Time.strptime(weather_data[:sunrise].to_s,'%s'))
    @sunset = time_to_12hr(Time.strptime(weather_data[:sunset].to_s,'%s'))
    @temp = weather_data[:temp][:day]
    @temp_high = weather_data[:temp][:max]
    @temp_low = weather_data[:temp][:min]
    @feels_like = weather_data[:feels_like][:day]
    @pressure = weather_data[:pressure]
    @humidity = weather_data[:humidity]
    @dew_point = weather_data[:dew_point]
    @clouds = weather_data[:clouds]
    @wind_speed = weather_data[:wind_speed]
    @wind_deg = weather_data[:wind_deg]
    @icon = icon_url(weather_data[:weather][0][:icon])
    
  end

  private

  def time_to_day(time)
    time.strftime("%A")
  end

end
