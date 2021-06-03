FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    encrypted_password   {password}
    first_name           {"山田"}
    first_name_kana      {"ヤマダ"}
    last_name            {"太郎"}
    last_name_kana       {"タロウ"}
    birth_date           {20000101}
  end
end