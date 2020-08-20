FactoryBot.define do
    factory :user do
        name { 'name' }
        email { Faker::Internet.email }
        password { 'example' }
    end
end