source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'activerecord-import'
gem 'aws-sdk-s3', '1.46.0', require: false
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'carrierwave'
gem 'devise'
gem 'faker'
gem 'html2slim'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'mini_magick'
gem 'nokogiri'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3'
gem 'sass-rails', '>= 6'
gem 'selenium-webdriver'
gem 'slim'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 4.0'
gem 'will_paginate'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'mysql2'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'rubocop-airbnb'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

group :production do
  gem 'fog'
  gem 'mysql2'
end
