FactoryBot.define do
  factory :item do
    title         { 'テスト' }
    explanation   { Faker::Lorem.sentence }
    category_id   { '2' }
    condition_id  { '2' }
    fee_id        { '2' }
    prefecture_id { '2' }
    day_id        { '2' }
    price         { '2000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
