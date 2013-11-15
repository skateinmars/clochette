module Payload
  class Github
    attr_reader :payload, :commits

    def initialize(params)
      @payload = JSON.parse(params['payload'])

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
