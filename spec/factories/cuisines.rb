FactoryBot.define do
  factory :cuisine do
    sequence(:name) { |n| "Cuisine #{n}" }
    sequence(:slug) { |n| "cuisine-#{n}"}

    factory :cuisine_with_restaurants do
      transient do
        restaurant_count { 3 }
      end

      restaurants do
        Array.new(restaurant_count) {
          association(:restaurant_with_images)
        }
      end
    end
  end
end