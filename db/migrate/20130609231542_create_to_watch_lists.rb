class CreateToWatchLists < ActiveRecord::Migration
  def change
    create_table :to_watch_lists do |t|
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
  end
end
