FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '陸太郎' }
    kana_last { 'ヤマダ' }
    kana_first { 'リクタ' }
    birthday { Faker::Date.birthday }
  end
end
