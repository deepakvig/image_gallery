# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :tag do
    content "Tag"
  end

  factory :album_tag, class: "Tag" do
    content "MyString"
    association :taggable, factory: :album
  end

end
