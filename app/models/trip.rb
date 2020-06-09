class Trip < ApplicationRecord
  validates_presence_of :start
  validates_presence_of :end
  validates_presence_of :travel_time
  validates_presence_of :arrival_forecast


end
