class Comment < ActiveRecord::Base
  attr_accessible :user_id, :idea_id, :comment

  belongs_to :idea
  belongs_to :user
end
