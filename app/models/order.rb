class Order < ApplicationRecord
  validates_inclusion_of :delivery, :in => [true, false]
  validates_presence_of :address

  def delivery?
    delivery
  end
end
