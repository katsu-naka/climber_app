class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @projects = Project.all.order("created_at DESC")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    unless @project.users.pluck(:user_id).any?(current_user.id)
      redirect_to root_path
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.users.pluck(:user_id).any?(current_user.id)
      @project.destroy
      redirect_to action: :index
    else
      redirect_to root_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name, user_ids:[])
  end

end
