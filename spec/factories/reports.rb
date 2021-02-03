# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    dish_name { Faker::Food.dish }
    service { 'UberEats' }
    price { 500 }
    association :user
    # association :shop
  end

  trait :yesterday do
    created_at { 1.day.ago }
  end

  trait :one_week_ago do
    created_at { 1.week.ago }
  end

  trait :one_month_ago do
    created_at { 1.month.ago }
  end
end
