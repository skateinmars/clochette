class ProjectsController < ApplicationController
  before_action :load_project, only: [:destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: t('.success')
    else
      flash.now[:alert] = t('.invalid')
      render action: 'new'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: t('.success')
  end

  private

  def load_project
    @project = Project.find_by_uid!(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
