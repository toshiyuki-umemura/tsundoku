FactoryBot.define do

  password = Faker::Internet.password(min_length: 6)

  factory :user do
    name                  {Faker::Name.name}
    nickname              {Faker::Name.initials(number: 8)}
    email                 {Faker::Internet.email}
    password              { password }
    password_confirmation { password }
  end
end