class Comment < ActiveRecord::Base
  attr_accessible :body, :idea_id, :user_id

  belongs_to :idea
  belongs_to :user
end
