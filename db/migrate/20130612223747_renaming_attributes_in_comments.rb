class RenamingAttributesInComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.rename :content_id, :idea_id
      t.rename :body, :comment
    end
  end
end