# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "War and Pease"
    short_description "short description for book"
    description "full description for War and Pease"
    picture "/path"
    in_stock "10"
    price 99.99
  end
end
