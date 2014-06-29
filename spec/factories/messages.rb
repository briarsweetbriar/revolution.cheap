# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    email "email@address.com"
    name "MyString"
    phone "512.782.4397"
    body "MyText MyText MyText MyText MyText MyText MyTextMyText MyText MyText MyText MyText MyText MyTextMyText MyText MyText MyText MyText MyText MyTextMyText MyText MyText MyText MyText MyText MyTextMyText MyText MyText MyText MyText MyText MyText"

    factory :invalid_message do
      name nil
    end
  end
end
