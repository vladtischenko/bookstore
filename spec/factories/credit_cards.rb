# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit_card do
    card_number {Faker::Number.number(16)}
    # expiration_month {Time.at(rand(Time.now.to_i)).strftime('%B')}
    expiration_month {Time.now.strftime('%B')}
    expiration_year {Time.now.year + rand(6)}
    code {Faker::Number.number(3)}
  end
end
