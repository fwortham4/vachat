class ChatroomsController < ApplicationController

  def index
    @user = current_user
    @new_chatroom = Chatroom.new
    @public_chatrooms = Chatroom.public_rooms
    @open_private_chats = Chatroom.open_private_rooms
    @private_room = Chatroom.find(2)

  end

  def show
    @user = current_user
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    if @chatroom.full?
      flash[:full] = "Sorry that chatroom is currently full."
      redirect_to root
    end
  end

  def create
    @chatroom = Chatroom.new(chat_params)
    if @chatroom.save
      redirect_to @chatroom
    else
      flash[:errors] = @chatroom.errors.full_messages
      render index
    end
  end

  private

  def chat_params
    params.require(:chatroom).permit(:topic, :private)
  end
end
