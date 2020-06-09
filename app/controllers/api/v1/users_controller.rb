class Api::V1::UsersController < Api::V1::BaseController

  def create
      user = User.create(user_params)
      token = JsonWebToken.encode({user_id: user.id})
      key_params = {params: {api_key: token}}
      response.status = :created
      render json: UserSerializer.new(user, key_params ).serialized_json
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
