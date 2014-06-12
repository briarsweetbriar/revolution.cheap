class Project < ActiveRecord::Base
  include ActsAsTaggable
  include ValidatorRegex

  extend FriendlyId
  friendly_id :title, use: :history

  has_many :project_roles, dependent: :destroy
  has_one :project_logo, dependent: :destroy
  has_one :slideshow, as: :slideshowable, dependent: :destroy

  validates :description, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
  validates :source, allow_blank: true, uri: { format: VALID_URI_REGEX }
  validates :title, presence: true, length: { in: 3..120 }
  validates :website, allow_blank: true, uri: { format: VALID_URI_REGEX }

  accepts_nested_attributes_for :project_roles, allow_destroy: true
end
