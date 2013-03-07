# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    title { Faker::Lorem.words.join(" ")}
    caption { Faker::Lorem.words}
    description { Faker::Lorem.paragraph} 
    blog_link "MyString"
    association :user
    
    factory :invalid_album do
      title ""
      caption ""
      description ""
      blog_link "MyString"
      association :user
    end 
  end
end
