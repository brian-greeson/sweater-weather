class HourlyConditions < WeatherConditions
  attr_reader :time, :temp, :feels_like, :pressure, :humidity, :description, :icon
  def initialize(weather_data)
    @time = date_to_hour(Time.strptime(weather_data[:dt].to_s,'%s'))
    @temp = weather_data[:temp]
    @feels_like = weather_data[:feels_like]
    @pressure = weather_data[:pressure]
    @humidity = weather_data[:humidity]
    @description = weather_data[:weather][0][:description]
    @icon = icon_url(weather_data[:weather][0][:icon])
  end

  private

  def date_to_hour(time)
    time.strftime("%l %p").strip
  end

end
