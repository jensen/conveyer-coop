class RestaurantImage < ApplicationRecord
  belongs_to :restaurant
  belongs_to :image
end
