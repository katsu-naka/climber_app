class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @task = Task.find(params[:task_id])
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast 'message_channel', content: message
    end
  end

  private

  def message_params
    params.require(:message).permit(:message,:name,:datetime).merge(user_id: current_user.id, task_id: params[:task_id])
  end
end
