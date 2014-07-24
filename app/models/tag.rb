class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history

  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings, source_type: "Post", source: :taggable
  has_many :projects, through: :taggings, source_type: "Project", source: :taggable

  validates :name, presence: true, length: { in: 3..30 }

  scope :named, ->(name) { where(name: name) }
end
