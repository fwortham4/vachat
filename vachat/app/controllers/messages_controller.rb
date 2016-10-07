class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    p current_user.email
    p "user email============================================="
    message.user = current_user
    if message.save
      ActionCable.server.broadcast "chatrooms_#{message.chatroom_id}_channel",
        email: message.user.email,
        message: message.content
      head :ok
    else
      redirect_to chatrooms_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end
