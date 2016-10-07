class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, uniqueness: true, case_sensitive: false

  def full?
    if self.private && self.users == 2
      true
    else
      false
    end
  end

  def self.public_rooms
    Chatroom.where(private: false)
  end

  def self.open_private_rooms
    Chatroom.where(private: true)
    # Chatroom.where(private: true).each do |c|
    #   if !c.full?
    #     open_rooms << c
    #   end
    # end
    # open_rooms
  end

end
