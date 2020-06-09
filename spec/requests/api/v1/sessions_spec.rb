require "rails_helper"

RSpec.describe "when client makes a post request to /sessions" do
  describe "With a valid username and password" do
    it "response with a api token" do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
      login_params =
      {
        "email": "whatever@example.com",
        "password": "password"
      }
      post "/api/v1/sessions", params: login_params

      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response_json[:data][:type]).to eq("user")
      expect(response_json[:data][:id]).to eq(user.id.to_s)
      expect(response_json[:data][:attributes][:email]).to eq(login_params["email"])
      expect(response_json[:data][:attributes][:api_key]).to_not eq(nil)


    end

  end

end
