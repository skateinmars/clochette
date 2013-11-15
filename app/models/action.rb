class Action
  TYPES = [:finish]

  attr_accessor :type, :ticket_id, :comment

  def initialize(type, options = {})
    self.type = type

    self.ticket_id = options[:ticket_id]
    self.comment = options[:comment]
  end
end
