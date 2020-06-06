class Api::V1::ForecastController < Api::V1::BaseController

  def index
    response = Hash.new({})
    response[:included] = {}
    response[:included][:location] = LocationService.geocode(forecast_params)

    render json: response
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
