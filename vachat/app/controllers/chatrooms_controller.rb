class ChatroomsController < ApplicationController

  def index
    @user = current_user
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
