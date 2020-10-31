class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    tasks = @user.tasks
    @tasks = tasks.where(date: Date.today).order("created_at DESC")  
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
  
end
