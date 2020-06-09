require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "validations" do
    it {should validate_presence_of(:origin)}
    it {should validate_presence_of(:destination)}
    it {should validate_presence_of(:travel_time)}
    it {should validate_presence_of(:arrival_forecast)}
  end

  describe "releationships" do
    it {should belong_to(:user)}
  end
end
