class ChatChannel < ApplicationCable::Channel
  def subscribed
    # What goes here????
    stream_from "chatroom"
  end
end