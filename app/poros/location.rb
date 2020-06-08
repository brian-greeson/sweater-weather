class Location
  attr_accessor :city, :state, :lat, :long, :place_id

  def initialize(location_json)
    @city = location_json[:results][0][:address_components][3][:long_name]
    @state = location_json[:results][0][:address_components][5][:short_name]
    @county = location_json[:results][0][:address_components][4][:long_name]
    @country = location_json[:results][0][:address_components][6][:long_name]
    @lat = location_json[:results][0][:geometry][:location][:lat]
    @long = location_json[:results][0][:geometry][:location][:lng]
    @place_id = location_json[:results][0][:place_id]
  end
end
