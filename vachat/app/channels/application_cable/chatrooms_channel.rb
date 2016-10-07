class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    # What goes here????
    stream_from "chatrooms_#{params['chatroom_id']}_channel"
  end

  def receive(data)
    ActionCable.server.broadcast "chatrooms_#{params['chatroom_id']}_channel", collection
  end

  def send_message(data)
    current_user.messages.create!(content: data['message'], chatroom_id: data['chatroom_id'])
  end
end
