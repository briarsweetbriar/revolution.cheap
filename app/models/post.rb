class Post < ActiveRecord::Base
  include ActsAsTaggable
  
  extend FriendlyId
  friendly_id :title, use: :history

  belongs_to :user

  validates :body, presence: true
  validates :title, presence: true, length: { in: 3..120 }
end
