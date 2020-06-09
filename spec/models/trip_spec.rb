require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "validations" do
    it {should validate_presence_of(:start)}
    it {should validate_presence_of(:end)}
    it {should validate_presence_of(:travel_time)}
    it {should validate_presence_of(:arrival_forecast)}
  end
end
