FactoryBot.define do
  factory :cuisine do
    name { "Vegetarian" }

    trait :with_restaurants do
      after(:create) do |cuisine|
        [
          'Restaurant 1',
          'Restaurant 2'
        ].map do |name|
          create(:restaurant, :with_images, name: name, cuisines: [cuisine])
        end
      end
    end
  end
end