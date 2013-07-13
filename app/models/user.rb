class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  rolify
  acts_as_tagger
  acts_as_taggable
  acts_as_taggable_on :interest

  scope :by_last_login, order("last_sign_in_at DESC")

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :slug
  before_create :assign_role

  has_many :topics

  def assign_role
    # assign a default role if no role is assigned
    self.add_role :user if self.roles.first.nil?
  end

end