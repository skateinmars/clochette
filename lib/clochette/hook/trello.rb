module Clochette
  module Hook
    class Trello
      attr_reader :actions

      def initialize(actions)
        @actions = actions
      end

      def perform
        actions.each do |action|
          if action.type == :finish
            mark_card_as_finished(action.ticket_id, action.comment)
          end
        end
      end

      private

      def mark_card_as_finished(card_id, comment)
        card = board.find_card(card_id)

        card.move_to_list(finished_list)
        card.add_comment(comment)
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
