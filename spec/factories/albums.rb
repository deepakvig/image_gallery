# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    title { Faker::Lorem.words.join(" ")}
    caption { Faker::Lorem.words}
    description { Faker::Lorem.paragraph} 
    blog_link "MyString"
    association :user
    after :create do |a|
      a.tags << FactoryGirl.create(:tag)
      a.comments << FactoryGirl.create(:comment)
    end
  end
    
  factory :invalid_album, class: Album do
    title ""
    caption ""
    description ""
    blog_link "MyString"
    association :user
  end 

end
