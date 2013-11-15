class GithubController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:hook]

  def hook
    payload = Payload::Github.new(JSON.parse(params['payload']))

    Hook.trigger(payload.actions)

    head :ok
  end
end
