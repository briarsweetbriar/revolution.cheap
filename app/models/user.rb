class User < ActiveRecord::Base
  attr_accessor :user_avatar_id

  extend FriendlyId
  friendly_id :username, use: :history
  
  devise :database_authenticatable

  has_many :posts, dependent: :destroy
  has_many :project_roles, dependent: :destroy
  has_many :projects, through: :project_roles
  has_one :user_avatar, dependent: :destroy

  validates :bio, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false },
    length: { in: 3..30 }

  before_save :ensure_authentication_token
  after_save :set_user_avatar

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  private
  def set_user_avatar
    UserAvatar.find_by_id(user_avatar_id).try(:set_user, self)
  end
end
