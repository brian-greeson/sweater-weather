class ApplicationController < ActionController::API


  def current_user(token = nil)
    begin
      @current_user ||= User.find(JsonWebToken.decode(api_key_params[:api_key])[:user_id])
    rescue NoMethodError
      not_authorized
    end
  end

  def api_key_params
    params.permit(:api_key)
  end

  def not_authorized
    response.status = :unauthorized
    render json: {errors: "Invalid Credentials"}
  end
end
