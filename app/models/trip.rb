class Trip < ApplicationRecord
  before_validation :determine_travel, :determine_forcast
  validates_presence_of :origin
  validates_presence_of :destination
  validates_presence_of :travel_time
  validates_presence_of :arrival_forecast

  belongs_to :user


  def determine_travel
    
  end

  def determine_forcast
  end

end
