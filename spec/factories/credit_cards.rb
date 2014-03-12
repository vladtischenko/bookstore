# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit_card do
    card_number 1236325897521025
    expiration_month "april"
    expiration_year 2015
    code 1212
    user 1
  end
end