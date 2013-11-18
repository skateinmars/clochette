class EventDispatcher
  ACTIONS = {
    'ticket_finished' => [Action::Trello::MarkCardAsFinished]
  }

  attr_reader :event

  def initialize(event)
    @event = event
  end

  def self.dispatch(events)
    events.each do |event|
      self.new(event).dispatch
    end
  end

  def dispatch
    actions.each do |action|
      action.new(event).perform
    end
  end

  private

  def actions
    ACTIONS.fetch(event.type, [])
  end
end
