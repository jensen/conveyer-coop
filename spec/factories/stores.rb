FactoryBot.define do
  factory :store do
    address { "123 Default Store Address" }
    postal_code { "A1A 1A1" }
    city
    restaurant
  end
end
