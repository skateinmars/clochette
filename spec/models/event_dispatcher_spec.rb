require 'spec_helper'

describe EventDispatcher do
  describe '.new' do
    let(:event) { 'event' }
    subject { EventDispatcher.new(event) }

    it "should set the event" do
      expect(subject.event).to eql(event)
    end
  end

  describe '.dispatch' do
    let(:events) do
      [
        Event.new('ticket_finished', ticket_id: 42),
        Event.new('ticket_finished', ticket_id: 43)
      ]
    end

    it 'should dispatch each event' do
      dispatcher_double = double('event_dispatcher')
      expect(dispatcher_double).to receive(:dispatch).twice

      expect(EventDispatcher).to receive(:new).
                                  with(events[0]).
                                  and_return(dispatcher_double)
      expect(EventDispatcher).to receive(:new).
                                  with(events[1]).
                                  and_return(dispatcher_double)

      EventDispatcher.dispatch(events)
    end
  end

  describe '#dispatch' do
    subject { EventDispatcher.new(event) }

    context "when the event has an action matching the defined triggers" do
      let(:event) { Event.new('ticket_finished', ticket_id: 42) }

      it "performs the matching action" do
        EventDispatcher::ACTIONS['ticket_finished'].each do |action_class|
          action_double = double('action')
          expect(action_double).to receive(:perform)

          expect(action_class).to receive(:new).
                                    with(event).
                                    and_return(action_double)
        end

        subject.dispatch
      end
    end

    context "when the event has an action matching no defined triggers" do
      let(:event) { Event.new('foobar', ticket_id: 42) }

      it "does nothing" do
        subject.dispatch
      end
    end
  end
end
