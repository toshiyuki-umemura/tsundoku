FactoryBot.define do

  factory :tag do
    tag { Faker::Lorem.characters(number: 10) }
  end
end