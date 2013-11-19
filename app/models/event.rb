class Event
  EVENT_TYPES = [
    'ticket_finished'
  ]

  attr_accessor :type, :parameters

  def initialize(type, parameters = {})
    self.type = type

    self.parameters = parameters
  end
end
