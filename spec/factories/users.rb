FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000000"}
    password_confirmation {password}
    last_name_kanji       {"安本"}
    first_name_kanji      {"悠人"}
    last_name_katakana    {"ヤスモト"}
    first_name_katakana   {"ユウト"}
    # birthday
  end
end