class GithubController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:hook]

  def hook
    payload = Clochette::Payload::Github.new(JSON.parse(params['payload']))

    Clochette::Hook.trigger(payload.actions)

    head :ok
  end
end
