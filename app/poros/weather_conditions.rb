class WeatherConditions
  attr_accessor :temp, :feels_like, :pressure, :humidity, :uv_index, :dew_point,
  :clouds, :visibility, :wind_speed, :wind_deg
  def initialize(weather_data)
    @temp = weather_data[:temp]
    @feels_like = weather_data[:feels_like]
    @pressure = weather_data[:pressure]
    @humidity = weather_data[:humidity]
    @uv_index = weather_data[:uvi]
    @dew_point = weather_data[:dew_point]
    @clouds = weather_data[:clouds]
    @visibility = weather_data[:visibility]
    @wind_speed = weather_data[:wind_speed]
    @wind_deg = weather_data[:wind_deg]
  end
end
