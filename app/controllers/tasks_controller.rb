class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.where(date: Date.today, user_id: current_user).order("created_at DESC")  
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    if @task.user == current_user
      render 'edit'
    else
      redirect_to action: :index
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path
    else
      render :edit
    end
  end

  def destroy
    if @task.user_id == current_user.id
      @task.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  def done_update
    @task = Task.find(params[:task_id])
    @task.update(done: 0)
    redirect_to action: :index
  end
  
  def done_remove
    @task = Task.find(params[:task_id])
    @task.update(done: 1)
    redirect_to action: :index
  end


  private

  
  def task_params
    params.require(:task).permit(:title, :text, :date ,:done).merge(user_id: current_user.id)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end

end
