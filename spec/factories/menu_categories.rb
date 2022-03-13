FactoryBot.define do
  factory :menu_category do
    name { "Category" }
    restaurant

    factory :menu_category_with_items do
      transient do
        items_count { 3 }
      end

      menu_items do
        Array.new(items_count) {
          association(:menu_item)
        }
      end
    end
  end
end