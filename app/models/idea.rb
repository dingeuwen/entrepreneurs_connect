class Idea < ActiveRecord::Base
  attr_accessible :user_id, :title, :summary, :problem_statement, :vision, :details,
  :what_i_need, :tag_list, :enable_private, :views

  acts_as_taggable

  belongs_to :user
  # has_many :content_tags
  has_many :comments, :dependent => :destroy

  acts_as_taggable_on :tag_list

  validates :summary, :length => { :maximum => 160 }

end



