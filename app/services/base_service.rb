class BaseService

  private

  def parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
