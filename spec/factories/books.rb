# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title {Faker::Commerce.product_name}
    short_description "short description for book"
    description "full description for book"
    picture "/path"
    in_stock {Faker::Number.decimal(0,10)}
    price {Faker::Commerce.price}
  end
end
