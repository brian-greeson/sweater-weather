require "rails_helper"

RSpec.describe "forcast api", type: :request  do
  describe "when a client request a forcast with location param" do
    before(:all) do
      @api_url = '/api/v1/'
    end

    it "Gets the coordinates of the location param" do
      VCR.use_cassette('forecast') do
        location_params = {location: "denver, co"}
        get @api_url + "forecast", params: location_params
      end
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json[:included][:location][:city]).to eq("Denver")
      expect(response_json[:included][:location][:state]).to eq("CO")
      expect(response_json[:included][:location][:lat]).to eq(39.7392358)
      expect(response_json[:included][:location][:long]).to eq(-104.990251)
    end

    it "provides forcast data at the provided location" do
      VCR.use_cassette('forecast') do
        location_params = {location: "denver, co"}
        get @api_url + "forecast", params: location_params
      end
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json[:data][:forecast][:current][:date]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:current][:feels_like]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:current][:humidity]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:current][:Visability]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:current][:uv_index]).to eq("10/10/99")


      expect(response_json[:data][:forecast][:hourly][:date]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:hourly][:summary]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:hourly][:summary_img]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:hourly][:temp]).to eq("10/10/99")

      expect(response_json[:data][:forecast][:day][:date]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:day][:accumilation]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:day][:temp_high]).to eq("10/10/99")
      expect(response_json[:data][:forecast][:day][:temp_low]).to eq("10/10/99")

    end
  end
end
