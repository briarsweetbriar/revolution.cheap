# Read about factories at https://github.com/thoughtbot/factory_girl

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :slideshow_image do
    slideshow
    
    file { fixture_file_upload("uploads/example.png", "image/png") }
  end
end
