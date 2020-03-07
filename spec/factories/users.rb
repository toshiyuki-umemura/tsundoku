FactoryBot.define do

  password = Faker::Internet.password(min_length: 6)

  factory :user do
    name                  {"aiueo"}
    nickname              {"aaiiuuee"}
    email                 {"kkk@gmail.com"}
    password              { password }
    password_confirmation { password }
  end
end