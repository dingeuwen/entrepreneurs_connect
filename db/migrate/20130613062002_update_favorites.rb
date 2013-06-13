class UpdateFavorites < ActiveRecord::Migration
  def change
    change_table :favorites do |t|
      t.remove :shared_on_fb, :shared_on_twitter, :deleted
      t.rename :content_id, :idea_id
    end
  end
end
