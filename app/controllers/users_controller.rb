class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @tasks = user.tasks
  end
end
