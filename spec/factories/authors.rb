# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :author do
    firstname "MyString"
    lastname "MyString"
    references ""
  end
end
