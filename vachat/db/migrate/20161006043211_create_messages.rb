class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :user_id, null: false
      t.integer :chatroom_id, null: false
      t.text :content, null: false

      t.timestamps(null: false)
    end
  end
end
