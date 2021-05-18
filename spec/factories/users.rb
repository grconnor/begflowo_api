FactoryBot.define do
  factory :user do
    name { "connor" }
    email { "user@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
