module Hook
  HOOKS = %w[trello]

  def self.trigger(actions)
    hooks.each do |hook|
      hook.new(actions).perform
    end
  end

  def self.hooks
    HOOKS.map do |hook_name|
      "Hook::#{hook_name.camelize}".constantize
    end
  end
end
