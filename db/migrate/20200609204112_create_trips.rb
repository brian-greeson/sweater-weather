class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start
      t.string :end
      t.string :travel_time
      t.string :arrival_forecast

      t.timestamps
    end
  end
end
