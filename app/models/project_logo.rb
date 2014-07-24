class ProjectLogo < ActiveRecord::Base
  mount_uploader :file, ThumbedImageUploader

  belongs_to :project

  validates :file, presence: true

  def set_project(project)
    self.project = project
    save
  end
end
