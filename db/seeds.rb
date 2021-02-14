# frozen_string_literal: true
User.create!(name: '山田 太郎',
  email: 'shinoyan@gmail.com',
  password: 'foobar',
  password_confirmation: 'foobar',
  admin: true)

5.time do |n|
  name = Faker::Nmae.name
  email = "example-#{n + 1}@nakasyoku.com"
  password = "foobar"
  User.create!(name: name, email: email)
