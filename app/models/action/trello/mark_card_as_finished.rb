module Action
  module Trello
    class MarkCardAsFinished
      attr_reader :event

      def initialize(event)
        @event = event
      end

      def perform
        card = board.find_card(card_id)

        card.move_to_list(finished_list)
        card.add_comment(comment)
      end

      private

      def card_id
        event.parameters[:ticket_id]
      end

      def comment
        event.parameters[:comment]
      end

      def board
        @board ||= ::Trello::Board.find(ENV['TRELLO_BOARD'])
      end

      def finished_list
        @finished_list ||= ::Trello::List.find(ENV['TRELLO_FINISHED_LIST'])
      end
    end
  end
end
