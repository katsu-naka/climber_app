class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    tasks = @user.tasks
    @tasks = tasks.where(date: Date.today).order("created_at DESC")  
  end
end
