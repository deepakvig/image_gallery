# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    name "MyString"
    email "admin@deepakvig.com"
    content "MyText"
  end

  factory :comment_with_invalid_email, class: "Comment" do
    name "MyString"
    email "admin@deepakvig"
    content "MyText"
  end

  factory :album_comment, class: "Comment" do
    name "MyString"
    email "admin@deepakvig.com"
    content "MyText"
    association :commentable, factory: :album
  end

end
