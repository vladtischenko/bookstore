# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title {Faker::Lorem.characters(10)}
  end
end
