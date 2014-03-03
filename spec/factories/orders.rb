# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    bill_adress "MyString"
    ship_address "MyString"
    state false
    user nil
  end
end
