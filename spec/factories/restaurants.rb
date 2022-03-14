FactoryBot.define do
  factory :restaurant do
    name { "Planetary Burger" }

    trait :with_images do
      after(:create) do |restaurant|
        create(:image, restaurants: [restaurant])
      end
    end
  end
end