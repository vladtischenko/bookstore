# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    short_description "MyText"
    description "MyText"
    picture "MyString"
    in_stock "MyString"
    price 1.5
  end
end
