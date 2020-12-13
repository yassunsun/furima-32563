FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    last_name_kanji
    first_name_kanji
    last_name_katakana
    first_name_katakana
    birthday
  end
end