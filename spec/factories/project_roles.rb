# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_role do
    project
    user

    title "MyString"
    name "MyString"
  end
end
