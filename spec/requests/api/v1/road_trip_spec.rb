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
      post "/api/v1/road_trip", params: trip_params

      response_json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response.status).to eq(200)
      expect(response_json[:data]).to eq("something here")
    end
  end
end
