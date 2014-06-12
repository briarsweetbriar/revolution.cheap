class Tag < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :history

  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings, class_name: "Post"
  has_many :projects, through: :taggings, class_name: "Project"

  validates :name, presence: true, length: { in: 3..30 }
end
