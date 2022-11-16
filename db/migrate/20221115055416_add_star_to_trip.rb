class AddStarToTrip < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :star, :float
  end
end
