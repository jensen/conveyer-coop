FactoryBot.define do
  factory :modification_option do
    name { "Default Modification Option" }
    price { 200 }
    multiple { false }
    modification

    trait :multiple do
      multiple { true }
    end
  end
end
