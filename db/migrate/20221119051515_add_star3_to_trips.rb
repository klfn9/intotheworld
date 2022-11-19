class AddStar3ToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :star3, :float
  end
end
