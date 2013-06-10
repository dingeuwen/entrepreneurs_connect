class RenameContentsToIdeas < ActiveRecord::Migration
  def change
    rename_table :Contents, :Ideas
  end
end
