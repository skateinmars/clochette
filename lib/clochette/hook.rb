require 'active_support/core_ext/string'

module Clochette
  HOOKS = %w[trello]

  module Hook
    def self.trigger(actions)
      hooks.each do |hook|
        hook.new(actions).perform
      end
    end

    def self.hooks
      HOOKS.map do |hook_name|
        "Clochette::Hook::#{hook_name.camelize}".constantize
      end
    end
  end
end

require_relative 'hook/trello'
