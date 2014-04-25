# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    price {Faker::Commerce.price}
    quantity {rand(1..10)}
    total {Faker::Commerce.price}
  end
end
