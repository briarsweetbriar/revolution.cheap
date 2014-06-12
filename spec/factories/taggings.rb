# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tagging do
    taggable { FactoryGirl.create(:post) }
    tag { Tag.all.sample || FactoryGirl.create(:tag) }
  end
end
