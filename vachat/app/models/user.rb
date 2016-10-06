class User < ApplicationRecord
  has_many :messages, foreign_key: :sender_id
  has_many :chatrooms, through: :messages
  validates :email, presence: true, uniqueness: true
end