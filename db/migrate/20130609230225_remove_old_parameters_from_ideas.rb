class RemoveOldParametersFromIdeas < ActiveRecord::Migration
  def up
    remove_column :ideas, :css
    remove_column :ideas, :deleted
    remove_column :ideas, :description
    remove_column :ideas, :html
    remove_column :ideas, :visible
    remove_column :ideas, :likes
    remove_column :ideas, :favorites
  end

  def down
    add_column :ideas, :favorites, :integer
    add_column :ideas, :likes, :integer
    add_column :ideas, :visible, :boolean
    add_column :ideas, :html, :text
    add_column :ideas, :description, :text
    add_column :ideas, :deleted, :boolean
    add_column :ideas, :css, :text
  end
end
