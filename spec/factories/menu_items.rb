FactoryBot.define do
  factory :menu_item do
    sequence(:name) { |n| "Item #{n}" }
    sequence(:description) { |n| "Description #{n}"}
    price { 350 }
    menu_category

    factory :menu_item_with_modifications do
      transient do
        modification_count { 2 }
      end

      modifications do
        Array.new(modification_count) {
          association(:modification_with_options)
        }
      end
    end
  end
end
