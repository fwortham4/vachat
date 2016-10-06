class ChatChannel < ApplicationCable::Channel
  def subscribed
    # What goes here????
    stream_from "messages"
  end

  def receive(data)
    ActionCable.server.broadcast "messages", collection
  end
end