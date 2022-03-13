class Restaurant < ApplicationRecord
  include Sluggable

  before_create :set_slug_from_name

  has_many :culinary_styles
  has_many :cuisines, through: :culinary_styles

  has_many :restaurant_images
  has_many :images, through: :restaurant_images

  has_many :menu_categories
  has_many :stores

  def format_cuisines
    self.cuisines.map { |cuisine| cuisine.name }.join(", ")
  end

  def format_header_image
    image = self.images.first
    "#{image.name}.#{image.extension}"
  end
end
