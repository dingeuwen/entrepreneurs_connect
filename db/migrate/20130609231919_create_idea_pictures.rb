class CreateIdeaPictures < ActiveRecord::Migration
  def change
    create_table :idea_pictures do |t|
      t.integer :ideas_id
      t.string :image

      t.timestamps
    end
  end
end
