# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :delivery do
    text {Faker::Lorem.word}
    price {Faker::Commerce.price}
  end
end
