class IdeaInvitations < ActiveRecord::Base
  attr_accessible :ideas_id, :user_id
  belongs_to :user
end
