FactoryBot.define do
  factory :user_buy do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    phone_number  { '123456789' }
    token         { 'tok_788c036f7f77d8fff5b986a9f925' }
  end
end
