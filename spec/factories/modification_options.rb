FactoryBot.define do
  factory :modification_option do
    sequence(:name) { |n| "Modification Option #{n}" }
    price { 200 }
    multiple { false }
    modification

    trait :multiple do
      multiple { true }
    end
  end
end
