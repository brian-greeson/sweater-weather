require "rails_helper"
RSpec.describe "forcast poro" do
  describe "when provided with a hash of forecast data" do
    it "it can output a forecast object" do
      forecast_json = File.read("./fixtures/forecast_return_data.json")
      forecast_data = JSON.parse(forecast_json, symbolize_names: true)
      forecast = Forecast.new(forecast_data)

      expect(forecast.class).to eq(Forecast)
      expect(forecast.current.class).to eq(CurrentConditions)

      expect(forecast.current.time).to_not eq("")
      expect(forecast.current.temp).to eq(303.02)
      expect(forecast.current.humidity).to eq(62)
      expect(forecast.current.uv_index).to eq(11.51)
      expect(forecast.current.visibility).to eq(16093)

      # expect(forecast.hourly[0].time).to eq("10 AM")
      expect(forecast.hourly[0].temp).to eq(303.02)
      expect(forecast.hourly[0].icon).to eq("http://openweathermap.org/img/wn/03d.png")

      # expect(forecast.hourly[11].time).to eq("9 PM")
      expect(forecast.hourly[11].temp).to eq(298.54)
      expect(forecast.hourly[11].icon).to eq("http://openweathermap.org/img/wn/02n.png")

      expect(forecast.daily[0].day).to eq("Sunday")
      expect(forecast.daily[0].temp_high).to eq(305.14)
      expect(forecast.daily[0].temp_low).to eq(297.78)
      expect(forecast.daily[0].temp).to eq(303.76)
      expect(forecast.daily[0].feels_like).to eq(304.91)
      expect(forecast.daily[0].icon).to eq("http://openweathermap.org/img/wn/02d.png")



    end

  end

end
