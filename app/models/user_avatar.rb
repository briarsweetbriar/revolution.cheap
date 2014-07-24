class UserAvatar < ActiveRecord::Base
  mount_uploader :file, ThumbedImageUploader

  belongs_to :user

  validates :file, presence: true

  def set_user(user)
    self.user = user
    save
  end
end
