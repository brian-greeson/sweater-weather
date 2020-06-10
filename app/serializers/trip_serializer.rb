class TripSerializer
  include FastJsonapi::ObjectSerializer
  set_type :trip
  set_id :id
  attributes :origin, :destination, :travel_time, :arrival_forecast
end
