class Order < ApplicationRecord
  has_many :line_items

  validates_inclusion_of :delivery, :in => [true, false]
  validates_presence_of :address

  def delivery?
    delivery
  end
end
