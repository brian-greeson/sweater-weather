class Api::V1::ForecastController < Api::V1::BaseController

  def index
    forecast_response = Hash.new
    forecast_response[:included] = {}
    forecast_response[:included][:location] = LocationService.geocode(forecast_params)

    forecast_response[:data] = ForecastService.forecast(forecast_response[:included][:location])
    render json: forecast_response
  end

  private

  def forecast_params
    params.permit(:location)
    params.merge(date: Date.today)
  end
end
