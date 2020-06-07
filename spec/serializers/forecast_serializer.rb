require "rails_helper"
RSpec.describe "forcast serializer" do
  describe "when provided with a hash of forecast data" do
    it "it can output a forecast object" do
      forecast_json = File.read("./fixtures/forecast_return_data.json")
      forecast_data = JSON.parse(forecast_json, symbolize_names: true)
      forecast_object = ForecastSerializer.injest(forecast_data)

      expect(forecast_object.class).to eq(Forecast)
      expect(forecast_object.current.class).to eq(WeatherConditions)
      expect(forecast_object.current.temp).to eq(303.02)
      expect(forecast_object.current.pressure).to eq(1011)
      expect(forecast_object.current.humidity).to eq(62)
      expect(forecast_object.current.uv_index).to eq(11.51)
      expect(forecast_object.current.dew_point).to eq(294.95)
      expect(forecast_object.current.clouds).to eq(40)
      expect(forecast_object.current.visibility).to eq(16093)
      expect(forecast_object.current.wind_speed).to eq(3.6)
      expect(forecast_object.current.wind_deg).to eq(60)
    end

  end

end

# "dt": 1591547187,
# "sunrise": 1591527974,
# "sunset": 1591579459,
# "temp": 303.02,
# "feels_like": 305.09,
# "pressure": 1011,
# "humidity": 62,
# "dew_point": 294.95,
# "uvi": 11.51,
# "clouds": 40,
# "visibility": 16093,
# "wind_speed": 3.6,
# "wind_deg": 60,
# "weather": [
#     {
#         "id": 802,
#         "main": "Clouds",
#         "description": "scattered clouds",
#         "icon": "03d"
#     }
# dt": 1591545600,
#             "temp": 303.02,
#             "feels_like": 303.93,
#             "pressure": 1011,
#             "humidity": 62,
#             "dew_point": 294.95,
#             "clouds": 40,
#             "wind_speed": 5.25,
#             "wind_deg": 65,
#             "weather": [
#                 {
#                     "id": 802,
#                     "main": "Clouds",
#                     "description": "scattered clouds",
#                     "icon": "03d"
#                 }
#             ]
