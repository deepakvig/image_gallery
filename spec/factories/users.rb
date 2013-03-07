# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "iiit1234" 

    factory :admin_user do
      email "admin@example.com"
      password "password"
    end
  end
end
