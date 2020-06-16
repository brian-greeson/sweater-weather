require "rails_helper"

RSpec.describe "forcast api", type: :request  do
  describe "when a client request a background with location param" do
    before(:all) do
      @api_url = '/api/v1/'
    end

    it "Gets a background image of the location param" do
      VCR.use_cassette('background', match_requests_on: [:path]) do
        location_params = {location: "chicago, il"}
        get @api_url + "backgrounds", params: location_params
      end
        response_json = JSON.parse(response.body, symbolize_names: true)

        expect(response_json[:data][:background]).to eq("https://lh3.googleusercontent.com/p/AF1QipNnXobmciHafcUKOLz_h2_EEFwbajpRyG84MM0a=s1600-w400")
    end
  end
end
