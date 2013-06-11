class RenameToWatchListModel < ActiveRecord::Migration
  def change
    rename_table :to_watch_lists, :rolodex_cards
  end
end
