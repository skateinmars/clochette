ENV['RACK_ENV'] = 'test'

Bundler.require(:default, :test)

require 'helpers'

SimpleCov.start do
  add_group 'Sinatra', 'lib/clochette/application.rb'

  add_filter 'spec'
  add_filter 'config'
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.order = "random"

  config.include Rack::Test::Methods
  config.include Helpers
end

def app
  Clochette::Application
end
