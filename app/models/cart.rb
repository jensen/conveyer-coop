class Cart < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy

  def item_count
    line_items.size
  end

  def empty?
    item_count == 0
  end

  def total
    sum = 0
    line_items.each do |item|
      sum += item.quantity * item.menu_item.price
    end
    sum
  end

  def delivery_address
    user.address
  end

  def pickup_address
    # this should get the closest store, right now it gets the first one in the list
    store = line_items.first.restaurant.stores.first
    "#{store.address}, #{store.postal_code}, #{store.city.name}"
  end

  def restaurant_name
    unless line_items.empty?
      line_items.first.restaurant.name
    end
  end
end
