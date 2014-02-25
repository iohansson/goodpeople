# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "e@mail.com"
    password "pass"
    password_confirmation "pass"
  end
end
