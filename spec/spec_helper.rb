ENV["RAILS_ENV"] ||= 'test'

require 'simplecov'

SimpleCov.start 'rails'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = "random"

  # # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # # examples within a transaction, remove the following line or assign false
  # # instead of true.
  # #
  # # Delegate transation policy to DatabaseCleaner.
  # config.use_transactional_fixtures = false

  config.include Helpers
end
