class EventDispatcher
  attr_reader :project, :event

  def initialize(project, event)
    @project = project
    @event = event
  end

  def self.dispatch(project, events)
    events.each do |event|
      self.new(project, event).dispatch
    end
  end

  def dispatch
    triggers_for_event_type(event.type).each do |trigger|
      Action.fetch(trigger.action_name).new(event).perform
    end
  end

  private

  def triggers_for_event_type(event_type)
    project.triggers.with_event_type(event_type)
  end
end
