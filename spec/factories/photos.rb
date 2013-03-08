# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    caption "MyString"
    description "MyText"
    image "MyString"
    #association :album
  end

  factory :invalid_photo do
    caption ""
    description ""
    image ""
    association :album
  end
end
