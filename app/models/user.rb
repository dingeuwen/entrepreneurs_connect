class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :profile_img_url, :first_name, :last_name, :bio,
                  :twitter_link, :github_link, :dribbble_link, :admin, :countries,
                  :undergrad, :role_interest, :industry_interest, :skills,
                  :entrepreneurship_goals, :views, :background, :employment_history,
                  :image, :remote_image_url, :skill_list, :country_list, :undergrad_list,
                  :role_interest_list, :industry_interest_list
  # is attr_protected necessary/useful?
  # attr_protected :admin, :views

  mount_uploader :image, ImageUploader

  acts_as_taggable_on :skills, :countries, :undergrad, :role_interest, :industry_interest
  validates_uniqueness_of :email

  # this is what i found online to validate custom email. but i dont get it!
  # class EmailValidator < ActiveModel::EachValidator
  #   def validate_each(record, attribute, value)
  #     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  #       record.errors[attribute] << (options[:message] || "is not an email")
  #     end
  #   end
  # end
  # class Person < ActiveRecord::Base
  #   validates :email, :presence => true, :email => true
  # end

  # the inclusion validation below isn't what I want. think I need a regex. haven't been able to figure it out though!
  # validates :email, :inclusion => { :in => %w(@mba2015.hbs.edu),
  #   :message => "@mba2015.hbs.edu e-mail required to sign up. If you are a member of a different year, school, or community and you would like to join, e-mail dingeuwen@gmail.com indicating your interest. If I get > 100 requests from other members of your school/group/community, I will create a new site for you."}
  validates_presence_of :password, :password_confirmation, :first_name, :last_name, :skill_list,
                        :country_list, :undergrad_list, :role_interest_list, :industry_interest_list
  validates :bio, :length => { :maximum => 140 }

  has_many :ideas
  has_many :to_watch_list
  has_many :idea_pictures
  has_many :idea_invitations




  has_many :favorites

end
