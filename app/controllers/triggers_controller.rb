class TriggersController < ApplicationController
  before_action :load_project
  before_action :load_trigger, only: [:destroy]

  before_action :build_trigger, only: [:create]

  def index
    @triggers = @project.triggers

    @trigger = Trigger.new(project: @project)
  end

  def create
    if @trigger.save
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.invalid')
    end

    redirect_to project_triggers_path(@project)
  end

  def destroy
    @trigger.destroy

    redirect_to project_triggers_path(@project), notice: t('.success')
  end

  private

  def load_project
    @project = Project.find_by_uid!(params[:project_id])
  end

  def load_trigger
    @trigger = @project.triggers.find(params[:id])
  end

  def build_trigger
    @trigger = @project.triggers.new(trigger_params)
  end

  def trigger_params
    params.require(:trigger).permit(:event_type, :action_name)
  end
end
