class UsersController < ApplicationController
  before_action :set_date, only: [:show]

  def show
    @user = User.find(params[:id])
    tasks = @user.tasks
    @tasks = tasks.where(date: @date).order("created_at DESC")  

    @dones = Task.where(done: 0, date: @date, user_id:@user.id).length
    @today_tasks = Task.where(date: @date, user_id:@user.id).length
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

  private

  def set_date
    if params[:date] == nil
      @date = Date.today.to_date
    else
      @date = params[:date].to_date
    end
  end

end
