class MessagesController < ApplicationController
  before_action :require_user

  def new
  end

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast("chatroom", { message: message, user: message.user.username })
      head :ok
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
