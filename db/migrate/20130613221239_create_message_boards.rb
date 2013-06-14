class CreateMessageBoards < ActiveRecord::Migration
  def change
    create_table :message_boards do |t|
      t.string :title
      t.text :blurb
      t.integer :num_of_comments, :default => 0

      t.timestamps
    end
  end
end
