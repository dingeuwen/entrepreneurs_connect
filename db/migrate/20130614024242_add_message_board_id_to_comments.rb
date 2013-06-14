class AddMessageBoardIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :message_board_id, :integer
  end
end
