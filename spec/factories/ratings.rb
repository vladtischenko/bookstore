# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    title "Not bad"
    text "I like it"
    rate 1
  end
end
