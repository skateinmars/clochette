class PayloadsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    payload = Payload.from_service(params[:service_name]).new(params)

    EventDispatcher.dispatch(payload.events)

    head :ok
  end
end
