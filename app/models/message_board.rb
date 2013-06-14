class MessageBoard < ActiveRecord::Base
  attr_accessible :blurb, :num_of_comments, :title

  has_many :comments, :dependent => :destroy
  belongs_to :user

end
