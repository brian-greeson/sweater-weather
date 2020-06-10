require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "validations" do
    it {should validate_presence_of(:origin)}
    it {should validate_presence_of(:destination)}
  end

  describe "releationships", :vcr do
    it {should belong_to(:user)}
  end
end
