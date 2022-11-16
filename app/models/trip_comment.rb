class TripComment < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :trip
end
