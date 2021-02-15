# frozen_string_literal: true
User.create!(name: 'しの しの',
  email: 'k.shinozaki8@gmail.com',
  password: 'shinoshino',
  password_confirmation: 'shinoshino',
  admin: true)

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@nakasyoku.com"
  password = "foobar"
  User.create!(name: name, email: email) 
end

10.times do 
  name = Faker::Restaurant.name
  address = Faker::Address.state
  opening_hour = "10:00 ~ 20:00"
  Shop.create!(name: name, address: address,opening_hour: opening_hour) 
end


