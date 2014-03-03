# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit_card do
    card_number 1
    expiration_month "MyString"
    expiration_year 1
    code 1
    user nil
  end
end
