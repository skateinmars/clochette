module Action
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def perform
  end
end
