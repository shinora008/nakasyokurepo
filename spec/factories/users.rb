FactoryBot.define do
  factory :user do
    name { Faker::Name.name}
    sequence(:email){|n| "example#{n}@example.com"}
    password { "foobar"}
    password_confirmation { "foobar" }
    introduction{ "オムライスが大好きです" }
  end
end