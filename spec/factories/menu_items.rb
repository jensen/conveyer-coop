FactoryBot.define do
  factory :menu_item do
    name { "Default Menu Item" }
    description { "Default Menu Item Description" }
    price { 350 }
    menu_category
  end
end
