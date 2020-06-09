class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: session_params[:email])
    if user.authenticate(session_params[:password])
      key_params = {params: {api_key: generate_token(user)}}
      response.status = :ok
      render json: UserSerializer.new(user, key_params ).serialized_json
    else
      response.status = :unauthorized
      render json: {error: "Invalid Credentials"}
    end

  end

  private

  def session_params
    params.permit(:email, :password)
  end

  def generate_token(user)
    JsonWebToken.encode({user_id: user.id})
  end
end
