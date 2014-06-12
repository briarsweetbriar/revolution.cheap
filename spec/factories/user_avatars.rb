# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user_avatar do
    user
    
    file { fixture_file_upload("uploads/example.png", "image/png") }
  end
end
