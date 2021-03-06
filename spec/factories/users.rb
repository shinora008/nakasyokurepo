# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) { |n| "example#{n}@example.com" }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    introduction { 'オムライスが大好きです' }

    trait :admin do
      admin { true }
    end
  end
end
