# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill_address do
    city "MyString"
    street "MyString"
    firstname "MyString"
    lastname "MyString"
    zipcode "MyString"
    phone "MyString"
    country nil
  end
end
