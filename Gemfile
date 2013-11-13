source 'https://rubygems.org'

ruby "2.0.0"

gem 'sinatra'
gem 'rake'

group :production do
  gem 'unicorn'
end

group :test do
  gem 'rspec'
  gem 'rack-test'
  gem 'simplecov'
  gem 'cane', require: false
end

group :development, :test do
  gem 'pry'
end
