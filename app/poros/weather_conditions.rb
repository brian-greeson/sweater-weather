class WeatherConditions

private

  def icon_url(filename)
    "http://openweathermap.org/img/wn/#{filename}.png"
  end

  def time_to_12hr(time)
    time.strftime("%l:%M %p").strip
  end
end
