class ResturantService
  def search(location)
    Faraday.get("")
  end
end
