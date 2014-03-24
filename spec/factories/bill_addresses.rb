# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill_address do
    city "New York"
    street "Allen st."
    firstname "Jack"
    lastname "Black"
    zipcode "558962-2500"
    phone "+56987552601"
    country nil
    user_id 11
  end
end
