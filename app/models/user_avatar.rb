class UserAvatar < ActiveRecord::Base
  mount_uploader :file, ThumbedImageUploader

  belongs_to :user

  validates :file, presence: true

  def set_user(user)
  	remove_other_avatars(user)
    update_attributes(user: user)
  end

  private
  def remove_other_avatars(user)
  	UserAvatar.where(user: user).each do |avatar|
  		avatar.delete if avatar != self
  	end
  end
end
