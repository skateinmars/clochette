module Action
  class << self
    def available_actions
      @@available_actions ||= {}
    end

    def register_action(action_name, action_class)
      available_actions.merge!({action_name => action_class})
    end

    def fetch(action_name)
      available_actions.fetch(action_name) do
        raise ArgumentError.new("Unregistered action #{action_name}")
      end
    end
  end
end
