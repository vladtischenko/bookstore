# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    order_total {Faker::Commerce.price}
    subtotal {Faker::Commerce.price}
    number {Faker::Number.number(3)}
    state {Faker::Lorem.word}
  end
end
