# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    order_total 0.5
    shipping 0.0
    subtotal 0.0
    number "123"
    state "in_progress"
  end
end
