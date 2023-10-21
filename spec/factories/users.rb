FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.first_name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    gimei = Gimei.name
    family_name           {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    family_name_kana      {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    date_of_birth         {Faker::Date.between(from: '1930-1-1', to: Date.today)}
  end
end