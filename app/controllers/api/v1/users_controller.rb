class Api::V1::UsersController < Api::V1::BaseController

  def create
      user = User.create(user_params)
      if user.valid?
        token = JsonWebToken.encode({user_id: user.id})
        key_params = {params: {api_key: token}}
        response.status = :created
        render json: UserSerializer.new(user, key_params ).serialized_json
      else
        response.status = :bad_request
        render json: {errors: user.errors.full_messages.to_sentence}.to_json
      end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
