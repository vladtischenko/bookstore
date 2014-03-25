# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    price 1.5
    quantity 1
    total 1.5
  end
end
