class Event
  attr_accessor :type, :parameters

  def initialize(type, parameters = {})
    self.type = type

    self.parameters = parameters
  end
end
