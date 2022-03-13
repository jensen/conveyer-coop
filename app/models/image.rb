class Image < ApplicationRecord
  has_many :restaurant_images
  has_many :restaurants, through: :restaurant_images
end