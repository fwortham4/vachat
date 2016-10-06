class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user, foreign_key: :sender_id
end