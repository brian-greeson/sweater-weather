class CurrentConditions < WeatherConditions
  attr_reader :time, :sunrise, :sunset, :temp, :temp_high, :temp_low, :feels_like, :humidity, :visibility, :uv_index, :description, :icon
  def initialize(weather_data)
    @time = time_to_time_month_day(Time.strptime(weather_data[:dt].to_s,'%s'))
    @sunrise = time_to_12hr(Time.strptime(weather_data[:sunrise].to_s,'%s'))
    @sunset = time_to_12hr(Time.strptime(weather_data[:sunset].to_s,'%s'))
    @temp = weather_data[:temp]
    @temp_high = nil
    @temp_low = nil
    @feels_like = weather_data[:feels_like]
    @pressure = weather_data[:pressure]
    @humidity = weather_data[:humidity]
    @dew_point = weather_data[:dew_point]
    @clouds = weather_data[:clouds]
    @uv_index = weather_data[:uvi]
    @visibility = weather_data[:visibility]
    @wind_speed = weather_data[:wind_speed]
    @wind_deg = weather_data[:wind_deg]
    @description = weather_data[:weather][0][:description]
    @icon = icon_url(weather_data[:weather][0][:icon])
  end

  private

  def time_to_time_month_day(time)
    time.strftime("%l:%M %p, %B%e").strip
  end
end
