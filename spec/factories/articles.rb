FactoryBot.define do
    factory :article do
        title { 'title' }
        content { Faker::Lorem.characters(number: 250) }
    end
end