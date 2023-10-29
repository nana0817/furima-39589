FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.characters(number: 40) }
    item_description { Faker::Lorem.characters(number: 1000) }
    category_id      { Faker::Number.within(range: 2..11) }
    condition_id     { Faker::Number.within(range: 2..7) }
    shipping_fee_id  { Faker::Number.within(range: 2..3) }
    prefecture_id    { Faker::Number.within(range: 2..48) }
    shipping_time_id { Faker::Number.within(range: 2..4) }
    price            { Faker::Number.within(range: 300..9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
