# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    phone "MyString"
    name "MyString"
    comment "MyText"
    actor
    event_date "2014-02-20"
  end
end
