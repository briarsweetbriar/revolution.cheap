# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.free_email }
    password "password"
    bio "Joe is a busy boy."

    factory :invalid_user do
      username nil
    end
  end
end
