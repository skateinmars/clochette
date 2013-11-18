class EventDispatcher
  ACTIONS = {
    'ticket_finished' => ['mark_card_as_finished_on_trello']
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
    actions.each do |action_name|
      Action.fetch(action_name).new(event).perform
    end
  end

  private

  def actions
    ACTIONS.fetch(event.type, [])
  end
end
