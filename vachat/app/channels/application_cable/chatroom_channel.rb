class ChatChannel < ApplicationCable::Channel
  def subscribed
    # What goes here????
    stream_from "chatroom"
  end

  def receive(data)
    ActionCable.server.broadcast "messages", collection
  end
end