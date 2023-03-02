FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Lorem.word }
    brew_time { Faker::Lorem.word }
    image { Faker::Lorem.word }
  end
end