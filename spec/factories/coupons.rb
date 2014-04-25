# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :coupon do
    code {Faker::Number.number(3)}
    price {Faker::Commerce.price}
  end
end
