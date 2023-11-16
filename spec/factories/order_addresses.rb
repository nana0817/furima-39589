FactoryBot.define do
  factory :order_address do
    post_code        { '105-0011' }
    prefecture_id    { 13 }
    municipalities   { '港区芝公園' }
    street_address   { '4丁目2-8' }
    building_name    { '東京タワー' }
    telephone_number { Faker::Number.number(digits: 11) }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
