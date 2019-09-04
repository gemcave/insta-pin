class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :friend_id
  end
end
