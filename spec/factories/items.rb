FactoryBot.define do
  factory :item do
    title         { 'テスト' }
    explanation   { 'テストです' }
    category_id   { '2' }
    condition_id  { '2' }
    fee_id        { '2' }
    prefecture_id { '2' }
    day_id        { '2' }
    price         { '2000' }
  end
end
