class User < ActiveRecord::Base
  include ValidatorRegex

  extend FriendlyId
  friendly_id :username, use: :history
  
  devise :database_authenticatable

  has_many :posts, dependent: :destroy
  has_many :project_roles, dependent: :destroy
  has_many :projects, through: :project_roles
  has_one :user_avatar, dependent: :destroy

  validates :bio, presence: true
  validates :github, allow_blank: true, uri: { format: VALID_URI_REGEX }
  validates :slug, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false },
    length: { in: 3..30 }
  validates :website, allow_blank: true, uri: { format: VALID_URI_REGEX }

  before_save :ensure_authentication_token

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
end
