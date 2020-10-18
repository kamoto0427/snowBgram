FactoryBot.define do

  factory :user do
    name                  {"kamome"}
    email                 {"aaa@gmail.com"}
    password              {"Aaaa1234"}
    password_confirmation {"Aaaa1234"}
    sequence(:email)      {Faker::Internet.email}
  end

end