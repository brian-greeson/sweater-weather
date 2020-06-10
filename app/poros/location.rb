class Location
  attr_accessor :city, :state, :lat, :long, :place_id

  def initialize(location_params = {})
    @city = location_params[:city]
    @state = location_params[:state]
    @county = location_params[:county]
    @country = location_params[:country]
    @lat = location_params[:lat]
    @long = location_params[:long]
    @place_id = location_params[:place_id]
  end

  def self.from_location_service(json)
    location_params =
    {
      city: json[:results][0][:address_components][0][:long_name],
      state: json[:results][0][:address_components][2][:short_name],
      county: json[:results][0][:address_components][1][:long_name],
      country: json[:results][0][:address_components][3][:long_name],
      lat: json[:results][0][:geometry][:location][:lat],
      long: json[:results][0][:geometry][:location][:lng],
      place_id: json[:results][0][:place_id]
    }
    Location.new(location_params)
  end

end
