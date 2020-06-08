class Api::V1::UsersController < Api::V1::BaseController
  def create
      user = User.create(user_params)
      binding.pry
      render json: user.to_json
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
