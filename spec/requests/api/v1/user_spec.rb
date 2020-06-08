require "rails_helper"

RSpec.describe "when a client makes a request to /user" do
  it "With the correct params they can create a user in the db" do
    user_params =
    {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    get '/api/v1/users', params: user_params
    response_json = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(response.status).to eq(201)
    expect(response_json[:data][:type]).to eq("users")
    expect(response_json[:data][:id]).to eq(user.id)
    expect(response_json[:data][:email]).to eq(user.email)
    expect(response_json[:data][:api_key]).to_not eq(user.api_key)

  end

end
