FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"a1" + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    last_name_kanji       {"安本"}
    first_name_kanji      {"悠人"}
    last_name_katakana    {"ヤスモト"}
    first_name_katakana   {"ユウト"}
    birthday              {Faker::Date.birthday}
  end
end