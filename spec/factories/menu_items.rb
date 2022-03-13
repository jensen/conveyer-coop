FactoryBot.define do
  factory :menu_item do
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description #{n}"}
    price { 350 }
    menu_category
  end
end