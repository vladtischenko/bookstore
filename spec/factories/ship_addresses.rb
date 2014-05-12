# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ship_address do
    city {Faker::Address.city}
    street {Faker::Address.street_address}
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    zipcode {Faker::Address.zip_code}
    phone {Faker::PhoneNumber.phone_number}
  end
end
