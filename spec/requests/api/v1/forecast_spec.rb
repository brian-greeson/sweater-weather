require "rails_helper"

RSpec.describe "forcast api", type: :request  do
  describe "when a client request a forcast with location param" do
    before(:all) do
      @api_url = '/api/v1/'
    end

    it "Gets the coordinates of the location param" do
      VCR.use_cassette('location', match_requests_on: [:path]) do
        location_params = {location: "chicago, il"}
        get @api_url + "forecast", params: location_params
      end
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json[:included][:location][:city]).to eq("Chicago")
      expect(response_json[:included][:location][:state]).to eq("IL")
      expect(response_json[:included][:location][:lat]).to eq(41.8781136)
      expect(response_json[:included][:location][:long]).to eq(-87.6297982)
    end

    it "provides forcast data at the provided location" do
      VCR.use_cassette('forecast_metric', match_requests_on: [:path]) do
        location_params = {location: "chicago, il"}
        get @api_url + "forecast", params: location_params
      end
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json[:data][:current][:time]).to_not eq("")
      expect(response_json[:data][:current][:feels_like]).to eq(21.99)
      expect(response_json[:data][:current][:humidity]).to eq(44)
      expect(response_json[:data][:current][:visibility]).to eq(16093)
      expect(response_json[:data][:current][:uv_index]).to eq(11.53)

      # expect(response_json[:data][:hourly][0][:time]).to eq("6 PM")
      expect(response_json[:data][:hourly][0][:description]).to eq("few clouds")
      expect(response_json[:data][:hourly][0][:icon]).to eq("http://openweathermap.org/img/wn/02d.png")
      expect(response_json[:data][:hourly][0][:temp]).to eq(24.15)

      expect(response_json[:data][:daily][0][:day]).to eq("Sunday")
      expect(response_json[:data][:daily][0][:accumilation]).to eq(nil)
      expect(response_json[:data][:daily][0][:temp_high]).to eq(24.15)
      expect(response_json[:data][:daily][0][:temp_low]).to eq(21.28)

    end
  end
end
