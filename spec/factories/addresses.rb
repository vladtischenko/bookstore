# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    country nil
    city "MyString"
    street "MyString"
    zipcode "MyString"
    phone "MyString"
  end
end
