class AddStar2ToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :star2, :float
  end
end
