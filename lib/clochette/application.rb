require 'json'

module Clochette
  class Application < Sinatra::Base
    configure do
      Dir["config/initializers/**/*.rb"].sort.each do |file_path|
        require File.join(Dir.pwd, file_path)
      end
    end

    post '/github' do
      payload = Payload::Github.new(JSON.parse(params['payload']))

      Clochette::Hook.trigger(payload.actions)

      200
    end
  end
end
