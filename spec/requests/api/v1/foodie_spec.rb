require 'rails_helper'

RSpec.describe "when a client sends a get request to /foodie" do
  describe "with start:, end:, and search: parameters" do
    it "responds with food trip json message" do
      VCR.use_cassette('roadtrip') do
        get '/api/v1/foodie?start=denver,co&end=anchorage,co&search=tacos'
      end
      foodie = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(foodie[:data][:id]).to eq("null")
      expect(foodie[:data][:type]).to eq("foodie")
      expect(foodie[:data][:attributes][:end_location]).to eq("Anchorage, AK")
      expect(foodie[:data][:attributes][:travel_time]).to eq("2 days 6 hours")
      expect(foodie[:data][:attributes][:forecast][:summary]).to eq("overcast clouds")
      expect(foodie[:data][:attributes][:forecast][:temperature]).to eq(9.78)
      expect(foodie[:data][:attributes][:restaurant][:name]).to eq("Humpy's Great Alaskan Alehouse")
      expect(foodie[:data][:attributes][:restaurant][:address]).to eq("610 W 6th Ave, Anchorage 99501")

    end

  end

end
