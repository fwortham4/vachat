class AddChatroomId < ActiveRecord::Migration[5.0]
  def change
    add_column :messages ,:chatroom_id, :integer
  end
end
