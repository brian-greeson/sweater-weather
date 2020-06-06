class Location
  attr_accessor :city, :state, :lat, :long

  def initialize(location_json)
    @city = location_json[:results][0][:address_components][0][:long_name]
    @state = location_json[:results][0][:address_components][2][:short_name]
    @county = location_json[:results][0][:address_components][1][:long_name]
    @country = location_json[:results][0][:address_components][3][:long_name]
    @lat = location_json[:results][0][:geometry][:location][:lat]
    @long = location_json[:results][0][:geometry][:location][:long]
  end
end
