# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :query do
    phone "MyString"
    name "MyString"
    comment "MyText"
  end
end
