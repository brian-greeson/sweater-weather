class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :trips, :start, :origin
    rename_column :trips, :end, :destination
  end
end
