class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id
  attribute :email
  attribute :api_key do |user, params|
    params[:api_key]
  end
end
