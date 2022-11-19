class TripComment < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :trip

  validates :comment, presence: true
end
