class ApplicationController < ActionController::API


  def current_user(token = nil)
    @current_user ||= User.find(JsonWebToken.decode(token)[:user_id])
  end
end
