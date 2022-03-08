class Cuisine < ApplicationRecord
  include Sluggable

  before_create :set_slug_from_name

  has_many :culinary_styles
  has_many :restaurants, through: :culinary_styles

end
