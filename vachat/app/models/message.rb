class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user#, foreign_key: :sender_id
  after_create_commit { MessageBroadcastJob.perform_later(self)}
end
