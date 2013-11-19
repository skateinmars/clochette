class PayloadsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]

  before_filter :load_project

  def create
    payload = Payload.from_service(params[:service_name]).new(params)

    EventDispatcher.dispatch(@project, payload.events)

    head :ok
  end

  private

  def load_project
    @project = Project.find_by_uid(params[:project_id])

    head :not_found unless @project
  end
end
