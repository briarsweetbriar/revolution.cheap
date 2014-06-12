class UserAvatar < ActiveRecord::Base
  mount_uploader :file, ThumbedImageUploader

  belongs_to :user

  validates :file, presence: true
end
