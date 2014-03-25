# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ship_address do
    city "New York"
    street "Allen st.17"
    firstname "Jonh"
    lastname "Lewis"
    zipcode "558555-2516"
    phone "+66987206801"
    country nil
  end
end
