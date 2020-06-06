require "rails_helper"

RSpec.describe "forcast api", type: :request do
  describe "when a client request a forcast with location param" do
    before(:all) do
      @api_url = '/api/v1/'
    end
    it "Gets the coordinates of the location param" do
      location_params = {location: "denver, co"}

      get @api_url + "forecast", params: location_params
      binding.pry

    end
    
    xit "provides forcast data at the provided location" do

    end

  end

end
