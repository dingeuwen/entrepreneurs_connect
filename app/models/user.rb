class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :profile_img_url, :first_name, :last_name, :bio,
                  :admin, :countries,
                  :undergrad, :role_interest, :industry_interest, :skills,
                  :entrepreneurship_goals, :views, :background, :employment_history,
                  :image, :remote_image_url, :skill_list, :country_list, :undergrad_list,
                  :role_interest_list, :industry_interest_list, :status
  # is attr_protected necessary/useful?
  # attr_protected :admin, :views

  mount_uploader :image, ImageUploader

  acts_as_taggable_on :skills, :countries, :undergrad, :role_interest, :industry_interest

  validates_uniqueness_of :email
  validate :image_or_remote_image_url_present
  validates :email, :format => {:with => /\A([^@\s]+)(@mba2015.hbs.edu|@mba2014.hbs.edu)\z/i, :message => "@mba2015.hbs.edu or @mba2014.hbs.edu e-mail required to sign up. If you are a member of a different year, school, or community and you would like to join, e-mail me at eding@mba2015.hbs.edu indicating your interest. If I get enough requests from other members of your school/group/community, I will create a new site for you."}

  def image_or_remote_image_url_present
    errors.add(:image, "can't be blank") unless image.present? || remote_image_url.present?
  end

  validates :bio, :length => { :maximum => 160 }

  has_many :ideas
  has_many :rolodex_cards
  has_many :favorites, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :message_boards


  # has_many :idea_pictures
  # has_many :idea_invitations


end
