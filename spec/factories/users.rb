# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "pupkin@example.com"
    firstname "Vasiliy"
    lastname "Pupkin"
    password "12345678"
  end
end
