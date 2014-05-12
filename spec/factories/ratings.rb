# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    rate {rand(1..5)}
  end
end
