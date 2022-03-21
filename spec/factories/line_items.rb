FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    menu_item
    cart
  end
end
