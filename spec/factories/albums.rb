# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    title { Faker::Lorem.words}
    caption { Faker::Lorem.words}
    description { Faker::Lorem.paragraph} 
    blog_link "MyString"
    association :user 
  end
end
