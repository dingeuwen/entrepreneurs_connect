class Idea < ActiveRecord::Base
  attr_accessible :user_id, :title, :views, :summary, :vision, :problem_statement, :details,
  :what_i_need, :private
  acts_as_taggable
  belongs_to :user
  # has_many :content_tags
  has_many :comments, :dependent => :destroy
end



