source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails', '4.0.1'

gem 'pg'

gem 'ruby-trello', require: 'trello'

gem 'haml-rails'
gem 'sass-rails', '~> 4.0'
gem 'bootstrap-sass', '~> 3.0'
gem 'jquery-rails'

group :production, :development do
  gem 'unicorn'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'database_cleaner'

  gem 'simplecov'
  gem 'cane', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'

  gem 'pry-rails'
  gem 'dotenv'
end

group :development do
  gem 'foreman'
end
