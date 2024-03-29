FactoryBot.define do
  factory :order_destination do
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
