module Action
  mattr_accessor :available_actions

  self.available_actions = {}

  class << self
    def register_action(action_name, action_class)
      self.available_actions.merge!({action_name => action_class})
    end

    def fetch(action_name)
      available_actions.fetch(action_name) do
        raise ArgumentError.new("Unregistered action #{action_name}")
      end
    end
  end
end
