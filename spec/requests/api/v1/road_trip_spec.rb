require 'rails_helper'
RSpec.describe "When a client makes a request to /road_trip" do
  describe "with valid params and api_key" do
    it "responds with the details of that road_trip" do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
      api_key = JsonWebToken.encode({user_id: user.id})

      trip_params =
      {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": api_key
      }
      VCR.use_cassette("road_trip") do
        post "/api/v1/road_trip", params: trip_params
      end
      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(response_json[:data][:type]).to eq("trip")
      expect(response_json[:data][:id]).to eq(Trip.first.id.to_s)
      expect(response_json[:data][:attributes][:origin]).to eq("Denver, CO, USA")
      expect(response_json[:data][:attributes][:destination]).to eq("Pueblo, CO, USA")
      expect(response_json[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
      expect(response_json[:data][:attributes][:arrival_forecast]).to eq("clear sky")

    end
  end
end
