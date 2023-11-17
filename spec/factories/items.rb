FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.characters(number: 40) }
    item_description { Faker::Lorem.characters(number: 1000) }
    category_id      { Faker::Number.within(range: 1..10) }
    condition_id     { Faker::Number.within(range: 1..6) }
    shipping_fee_id  { Faker::Number.within(range: 1..2) }
    prefecture_id    { Faker::Number.within(range: 1..47) }
    shipping_time_id { Faker::Number.within(range: 1..3) }
    price            { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
