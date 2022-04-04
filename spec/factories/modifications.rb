FactoryBot.define do
  factory :modification do
    name { "Default Modification" }
    required { false }
    max_options { 2 }

    trait :required do
      required { true }
    end
  end
end
