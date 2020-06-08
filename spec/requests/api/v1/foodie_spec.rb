require 'rails_helper'

RSpec.describe "when a client sends a get request to /foodie" do
  describe "with start:, end:, and search: parameters" do
    it "responds with food trip json message" do

      get '/api/v1/foodie?start=denver,co&end=anchorage,co&search=tacos'

      foodie = JSON.parse(response.body, serialize_names: true)

      expect(foodie[:data][:id]).to eq("null")
      expect(foodie[:data][:type]).to eq("foodie")
      expect(foodie[:data][:attributes][:end_location]).to eq("")
      expect(foodie[:data][:attributes][:travel_time]).to eq("")
      expect(foodie[:data][:attributes][:forecast][:summary]).to eq("")
      expect(foodie[:data][:attributes][:forecast][:temperature]).to eq("")
      expect(foodie[:data][:attributes][:restaurant][:name]).to eq("")
      expect(foodie[:data][:attributes][:restaurant][:address]).to eq("")

    end

  end

end
