class Api::V1::BackgroundController < Api::V1::BaseController

 def index
   photo_url = BackgroundService.new.location_background(LocationService.geocode(background_params))
   render json: {data: {background: photo_url}}
 end

 private

 def background_params
   params.permit(:location)
 end
end
