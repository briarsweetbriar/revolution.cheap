# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slideshow do
    slideshowable { FactoryGirl.create :project }
    title "MyString"
  end
end
