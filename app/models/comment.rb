class Comment < ActiveRecord::Base
  attr_accessible :user_id, :idea_id, :comment, :message_board_id

  belongs_to :idea
  belongs_to :user
  belongs_to :message_board
end
