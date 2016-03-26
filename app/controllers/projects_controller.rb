class ProjectsController < ApplicationController
  before_action :authenticate
  before_action :set_developer, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to developers_path, notice: "Project was created with success."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to developers_path, notice: "Developer was created with success."
    else
      render :index
    end
  end

  def destroy
    @project.destroy
    redirect_to developers_path, notice: 'Project was destroyed with extreem prejudice.'
  end


  def show

  end

  private
    def set_developer
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :allowed_hours)
    end
end
