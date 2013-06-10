class IdeaPictures < ActiveRecord::Base
  attr_accessible :ideas_id, :image
  belongs_to :user
end
