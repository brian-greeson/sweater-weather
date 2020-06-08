class Restaurant
  attr_reader :name, :address
  def initialize(restaurant)
    @name = restaurant[:name]
    @address = restaurant[:location][:address]
  end
end
