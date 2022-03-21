class LineItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :cart

  has_one :menu_category, through: :menu_item
  has_one :restaurant, through: :menu_category

  validates :quantity, numericality: { greater_than: 0, less_than: 100 }
end
