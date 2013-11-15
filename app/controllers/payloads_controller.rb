class PayloadsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    payload = Payload.from_service(params[:service_name]).new(params)

    Hook.trigger(payload.actions)

    head :ok
  end
end
