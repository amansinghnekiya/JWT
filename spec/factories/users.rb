FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.username }
    role { 'admin' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end