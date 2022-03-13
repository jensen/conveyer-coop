FactoryBot.define do
  factory :restaurant do
    sequence(:name) { |n| "Restaurant #{n}" }
    sequence(:slug) { |n| "restaurant-#{n}"}

    factory :restaurant_with_images do
      transient do
        image_count { 3 }
      end

      images do
        Array.new(image_count) {
          association(:image)
        }
      end

    end
  end
end