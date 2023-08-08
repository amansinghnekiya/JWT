FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence }
    date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 30.days) }
    location { Faker::Address.full_address }
    ticket_availability { Faker::Number.between(from: 0, to: 100) }
    price { Faker::Number.number(digits: 2) }
    category { 'music' }
    user
  end
end