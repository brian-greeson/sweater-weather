class Api::V1::RoadTripController < Api::V1::BaseController
  before_action :current_user

  def create
   trip = current_user.trips.create(trip_params)
   if trip.valid?
     response.status = :ok
     render json: TripSerializer.new(trip).serialized_json
   else
     response.status = :bad_request
     render json: {errors: trip.errors.full_messages.to_sentence}
   end
  end

  private

  def trip_params
    params.permit(:origin, :destination)
  end
end
