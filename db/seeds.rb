User.create!(name:  "山田 太郎",
  email: "shinoyan@gmail.com",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true) 

10.times do |n|
  Report.create!(dish_name: Faker::Food.dish,
  service: "UberEats",
  price: "500",
  user_id: 1)
end