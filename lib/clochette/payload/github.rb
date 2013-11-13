module Clochette
  module Payload
    class Github
      attr_reader :payload

      TICKET_PATTERN = /((close|fix)e?s? \D?([0-9]+))/i
      ACTION_TYPE = :finish

      def initialize(payload)
        @payload = payload
      end

      def commits
        @commits ||= @payload['commits'].map do |commit|
          OpenStruct.new(
            url: commit['url'],
            email: commit['author']['email'],
            message: commit['message'])
        end
      end

      def actions
        @actions ||= commits.reduce([]) do |actions, commit|
          message = commit.message

          while match = message.match(TICKET_PATTERN) do
            message.slice!(match[0])
            actions << { action_type: ACTION_TYPE, ticket_id: match[3].to_i }
          end

          actions
        end
      end
    end
  end
end
