FactoryBot.define do
  factory :modification do
    sequence(:name) { |n| "Modification #{n}" }
    required { false }
    max_options { 2 }

    trait :required do
      required { true }
    end

    factory :modification_with_options do
      transient do
        option_count { 3 }
      end

      modification_options do
        Array.new(option_count) {
          association(:modification_option)
        }
      end
    end
  end
end
