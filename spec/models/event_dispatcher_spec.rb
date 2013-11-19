require 'spec_helper'

describe EventDispatcher do
  describe '.new' do
    let(:event) { double('event') }
    let(:project) { double('project') }
    subject { EventDispatcher.new(project, event) }

    it "should set the event" do
      expect(subject.event).to eql(event)
    end

    it "should set the project" do
      expect(subject.project).to eql(project)
    end
  end

  describe '.dispatch' do
    let(:project) { double('project') }
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
                                  with(project, events[0]).
                                  and_return(dispatcher_double)
      expect(EventDispatcher).to receive(:new).
                                  with(project, events[1]).
                                  and_return(dispatcher_double)

      EventDispatcher.dispatch(project, events)
    end
  end

  describe '#dispatch' do
    let(:project) { FactoryGirl.create(:project) }
    let(:event) { Event.new('ticket_finished', ticket_id: 42) }

    subject { EventDispatcher.new(project, event) }

    context "when the project has a Trigger matching the event" do
      let!(:action) do
        Trigger.create!(project: project,
                        event_type: 'ticket_finished',
                        action_name: 'no_op')
      end

      it "performs the matching action" do
        action_double = double('action')
        expect(action_double).to receive(:perform)

        expect(Action::NoOp).to receive(:new).
                                  with(event).
                                  and_return(action_double)

        subject.dispatch
      end
    end

    context "when the event has an action matching no defined triggers" do
      it "does nothing" do
        subject.dispatch
      end
    end
  end
end
