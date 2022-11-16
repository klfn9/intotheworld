class Tag < ApplicationRecord
  has_many :trip_tags, dependent: :destroy
    has_many :trips, through: :trip_tags
end
