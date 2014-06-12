# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user { User.all.sample || FactoryGirl.create(:user) }

    title "MyString"
    body "MyText"

    factory :invalid_post do
      title nil
    end
  end
end
