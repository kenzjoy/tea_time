FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    address { Faker::Address.street_address }
  end
end