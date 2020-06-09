require "rails_helper"

RSpec.describe "when client makes a post request to /sessions" do
  after(:all) do
    User.destroy_all
  end

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

      expect(response.status).to eq(200)
      expect(response_json[:data][:type]).to eq("user")
      expect(response_json[:data][:id]).to eq(user.id.to_s)
      expect(response_json[:data][:attributes][:email]).to eq(login_params[:email])
      expect(response_json[:data][:attributes][:api_key]).to_not eq(nil)
    end
  end

  describe "With invalid credentials" do
    it "response with status 400 and error message" do
      user = User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
      login_params =
      {
        "email": "whatever@example.com",
        "password": "theWrongPassword"
      }
      post "/api/v1/sessions", params: login_params

      response_json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(response_json[:error]).to eq("Invalid Credentials")

    end

  end

end
