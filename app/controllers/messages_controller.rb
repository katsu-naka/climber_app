class MessagesController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    message = Message.new(message_params)
    message.save
  end

  private

  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id, task_id: params[:task_id])
  end
end
