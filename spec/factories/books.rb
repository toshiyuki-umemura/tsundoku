FactoryBot.define do

  factory :book do
    title   { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 250) }
    user_id { Random.rand(1..1000) }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end