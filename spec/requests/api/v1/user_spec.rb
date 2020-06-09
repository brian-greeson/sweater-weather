require "rails_helper"

RSpec.describe "when a client makes a request to /user" do
  after(:all) do
    User.destroy_all
  end
  it "With the correct params they can create a user in the db" do
    user_params =
    {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: user_params
    response_json = JSON.parse(response.body, symbolize_names: true)
    user = User.last

    expect(response.status).to eq(201)
    expect(response_json[:data][:type]).to eq("user")
    expect(response_json[:data][:id]).to eq(user.id.to_s)
    expect(response_json[:data][:attributes][:email]).to eq(user.email)
    expect(response_json[:data][:attributes][:api_key]).to_not eq(nil)

  end

  it "With invalid params the response is 4XX and relevent error message" do
    user_params =
    {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "NotTheSamepassword"
    }
    post '/api/v1/users', params: user_params
    response_json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(response_json[:errors]).to eq("Password confirmation doesn't match Password")
  end

  it "Cannot register duplicate emails" do
    User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
    user_params =
    {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
    post '/api/v1/users', params: user_params
    response_json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(response_json[:errors]).to eq("Email has already been taken")
  end

  it "Response with multiple errors" do
    User.create!(email: "whatever@example.com", password: "password", password_confirmation: "password")
    user_params =
    {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "NotTheSamepassword"
    }
    post '/api/v1/users', params: user_params
    response_json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(response_json[:errors]).to eq("Email has already been taken and Password confirmation doesn't match Password")
  end

end
