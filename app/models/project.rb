class Project < ActiveRecord::Base
  attr_accessor :project_logo_id
  include ActsAsTaggable
  include ValidatorRegex

  extend FriendlyId
  friendly_id :title, use: :history

  has_many :project_roles, dependent: :destroy
  has_many :users, through: :project_roles, source: :user
  has_one :project_logo, dependent: :destroy
  has_one :slideshow, as: :slideshowable, dependent: :destroy

  validates :description, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  validates :title, presence: true, length: { in: 3..120 }

  after_save :set_project_logo

  accepts_nested_attributes_for :project_roles, allow_destroy: true

  def users_include?(user_in_question)
    return true if users.where(id: user_in_question.id).exists?
    return false
  end

  private
  def set_project_logo
    ProjectLogo.find_by_id(project_logo_id).try(:set_project, self)
  end
end
