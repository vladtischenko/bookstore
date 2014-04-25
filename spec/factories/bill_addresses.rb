# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill_address do
    city {Faker::Address.city}
    street {Faker::Address.street_address}
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    zipcode {Faker::Address.zip_code}
    phone {Faker::PhoneNumber.phone_number}
    country nil
    user_id 11
  end
end
