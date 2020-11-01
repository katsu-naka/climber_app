class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    tasks = @user.tasks
    @tasks = tasks.where(date: Date.today).order("created_at DESC")  

    @dones = Task.where(done: 0, date:Date.today,user_id:@user.id).length
    @today_tasks = Task.where(date: Date.today,user_id:@user.id).length
    @progress = 0
    if @tasks.present?
      @progress = ((@dones.to_f/@today_tasks.to_f) * 100).to_i
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

end
