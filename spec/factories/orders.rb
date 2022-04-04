FactoryBot.define do
  factory :order do
    delivery { true }
    address { "123 Default Order Address, Postal Code, City" }

    trait :invalid do
      address { "" }
    end
  end
end
