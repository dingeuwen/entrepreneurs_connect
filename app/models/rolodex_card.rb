class RolodexCard < ActiveRecord::Base
  attr_accessible :user1_id, :user2_id
  belongs_to :user
end
