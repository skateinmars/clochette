require 'spec_helper'

describe Action::Trello::MarkCardAsFinished do
  describe '.new' do
    let(:event) { Event.new('ticket_finished', ticket_id: 42) }
    subject { Action::Trello::MarkCardAsFinished.new(event) }

    it "should set the event attribute" do
      expect(subject.event).to eql(event)
    end
  end

  context 'given ticket_finished Event' do
    let(:event) { Event.new('ticket_finished', ticket_id: 42) }
    subject { Action::Trello::MarkCardAsFinished.new(event) }

    describe '#perform' do
      it 'should move a card on the Trello API' do
        finished_list_mock = double('finished_list')
        expect(::Trello::List).to receive(:find).and_return(finished_list_mock)

        board_mock = double('board')
        expect(::Trello::Board).to receive(:find).and_return(board_mock)

        card = double('card')

        expect(board_mock).to receive(:find_card).with(42).and_return(card)
        expect(card).to receive(:move_to_list).with(finished_list_mock)
        expect(card).to receive(:add_comment)

        subject.perform
      end
    end
  end
end
