class RemoveViewsFromIdeas < ActiveRecord::Migration
  def change
    change_table :ideas do |t|
      t.remove :views
    end
  end
end
