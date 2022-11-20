class AddStarAverageToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :star_average, :float
  end
end
