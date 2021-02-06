# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    name { '牛丼' }
    address { '福岡県' }
    opening_hour { '10:00~22:00' }
  end
end
