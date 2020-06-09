class JsonWebToken
  BASE_KEY = Rails.application.secrets.secret_key_base
  def self.encode(payload, exp = 1.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, BASE_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, BASE_KEY)[0]
    HashWithIndifferentAccess.new body
  rescue
    nil
  end
end
