# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :project_logo do
    project

    file { fixture_file_upload("uploads/example.png", "image/png") }
  end
end
