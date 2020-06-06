require "rails_helper"

RSpec.describe "forcast api", type: :request  do
  describe "when a client request a forcast with location param" do
    before(:all) do
      @api_url = '/api/v1/'
    end

    it "Gets the coordinates of the location param" do
      VCR.use_cassette('google_location') do
        location_params = {location: "denver, co"}
        get @api_url + "forecast", params: location_params
      end
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json[:included][:location][:city]).to eq("Denver")
      expect(response_json[:included][:location][:state]).to eq("CO")
      expect(response_json[:included][:location][:lat]).to eq(39.7392358)
      expect(response_json[:included][:location][:long]).to eq(-104.990251)
    end

    xit "provides forcast data at the provided location" do

    end
  end
end
