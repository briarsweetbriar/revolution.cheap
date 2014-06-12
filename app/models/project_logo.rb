class ProjectLogo < ActiveRecord::Base
  mount_uploader :file, ThumbedImageUploader

  belongs_to :project

  validates :file, presence: true
end
