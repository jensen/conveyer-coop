class MenuItem < ApplicationRecord
  belongs_to :menu_category

  has_many :customizations
  has_many :modifications, through: :customizations
end
