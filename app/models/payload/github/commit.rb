module Payload
  class Github
    class Commit
      TICKET_PATTERN = /((close|fix)e?s? \D?([0-9]+))/i
      EVENT_TYPE = 'ticket_finished'

      attr_reader :id, :url, :author, :message

      def initialize(commit_data)
        @id = commit_data['id']
        @url = commit_data['url']
        @author = commit_data['author']['name']
        @message = commit_data['message']
      end

      def comment
        "#{author}: #{message} (#{url})"
      end

      def events
        return @events if @events

        @events = []
        filtered_message = message.dup

        while match = filtered_message.match(TICKET_PATTERN) do
          filtered_message.slice!(match[0])
          @events << Event.new(EVENT_TYPE,
                                ticket_id: match[3].to_i,
                                comment: comment)
        end

        @events
      end
    end
  end
end
