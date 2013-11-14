source 'https://rubygems.org'

ruby "2.0.0"

gem 'activesupport'
gem 'rake'

gem 'sinatra'

gem 'ruby-trello', require: 'trello'

group :production, :development do
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

group :development do
  gem 'foreman'
end
