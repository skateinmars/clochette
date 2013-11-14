require 'clochette/payload/github/commit'

module Clochette
  module Payload
    class Github
      attr_reader :payload, :commits

      def initialize(payload)
        @payload = payload

        extract_commits
      end

      def actions
        @actions ||= commits.reduce([]) do |actions, commit|
          actions + commit.actions
        end
      end

      private

      def extract_commits
        @commits ||= @payload['commits'].map do |commit|
          Commit.new(commit)
        end
      end

    end
  end
end
