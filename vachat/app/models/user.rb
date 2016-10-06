class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :messages, foreign_key: :sender_id
  has_many :chatrooms, through: :messages
  validates :email, presence: true, uniqueness: true
end
