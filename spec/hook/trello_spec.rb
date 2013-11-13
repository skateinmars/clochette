require 'spec_helper'
require 'clochette/hook/trello'

describe Clochette::Hook::Trello do
  context 'given a Trello post hook Hook' do
    let(:actions) do [{action_type: :finish, ticket_id: 20},
                      {action_type: :finish, ticket_id: 21}]
    end
    subject { Clochette::Hook::Trello.new(actions) }

    describe '#perform' do
      it 'should move 2 cards' do
        finished_list_mock = double('finished_list')
        expect(::Trello::List).to receive(:find).and_return(finished_list_mock)

        board_mock = double('board')
        expect(::Trello::Board).to receive(:find).and_return(board_mock)

        card_20 = double('card')
        card_21 = double('card')

        expect(board_mock).to receive(:find_card).with(20).and_return(card_20)
        expect(board_mock).to receive(:find_card).with(21).and_return(card_21)

        expect(card_20).to receive(:move_to_list).with(finished_list_mock)
        expect(card_21).to receive(:move_to_list).with(finished_list_mock)

        expect(card_20).to receive(:add_comment)
        expect(card_21).to receive(:add_comment)

        subject.perform
      end
    end
  end
end
