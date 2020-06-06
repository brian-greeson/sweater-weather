class Api::V1::ForecastController < Api::V1::BaseController

  def index
    location = LocationService(forecast_params)
    render json: location
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
