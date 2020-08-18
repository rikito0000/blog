FactoryBot.define do
    factory :article do
       title { Faker::Lorem.characters(number: 30) }
       content { Faker::Lorem.characters(number: 255) }
    end
end