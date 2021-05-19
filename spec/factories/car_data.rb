FactoryBot.define do
  factory :car_data do
    regnum { "ABC123" }
    ordernum { "00001" }
    make { "Mercedes" }
    model { "C63 AMG" }
    year { 2021 }
    color { "Black" }
    mileage { "1020 km" }
    association :user, factory: :user
  end
end
