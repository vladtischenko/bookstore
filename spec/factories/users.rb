# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    password {Faker::Internet.password(8)}
  end
end
