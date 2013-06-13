class AddViewsWithDefaultToIdeas < ActiveRecord::Migration
  def change
    change_table :ideas do |t|
      t.integer :views, :default => 0
      t.boolean :marked_as_deleted, :default => false
    end
  end
end
