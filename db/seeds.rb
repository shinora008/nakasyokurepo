# frozen_string_literal: true

User.create!(name: '山田 太郎',
             email: 'shinoyan@gmail.com',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true)
