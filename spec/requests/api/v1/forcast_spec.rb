require "rails_helper"

RSpec.describe "forcast api", type: :request do
  describe "when a client request a forcast with location param" do
    before(:all) do
      @api_url = '/api/v1/'
    end
    it "Gets the coordinates of the location param" do
      location_params = {location: "denver, co"}

      get @api_url + "forecast", params: location_params

      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json[:included][:location][:city]).to eq("denver")
      expect(response_json[:included][:location][:state]).to eq("co")
      expect(response_json[:included][:location][:lat]).to eq("")
      expect(response_json[:included][:location][:long]).to eq("")

      # expect(response_json[:data][:forcast]["12/12/99"][:temp_high]).to eq("72")
      # expect(response_json[:data][:forcast]["12/12/99"][:temp_low]).to eq("72")
      # expect(response_json[:data][:forcast]["12/12/99"][:temp_summary]).to eq("sunny")
      # expect(response_json[:data][:forcast]["12/12/99"][:temp_humidity]).to eq("72")
      # expect(response_json[:data][:forcast]["12/12/99"][:temp_high]).to eq("72")


    end

    xit "provides forcast data at the provided location" do

    end

  end

end
