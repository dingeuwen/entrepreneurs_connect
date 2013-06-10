class CreateIdeaInvitations < ActiveRecord::Migration
  def change
    create_table :idea_invitations do |t|
      t.integer :ideas_id
      t.integer :user_id

      t.timestamps
    end
  end
end
