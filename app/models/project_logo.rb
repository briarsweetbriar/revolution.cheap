class ProjectLogo < ActiveRecord::Base
  mount_uploader :file, ThumbedImageUploader

  belongs_to :project

  validates :file, presence: true

  def set_project(project)
    remove_other_logos(project)
    update_attributes(project: project)
  end

  private
  def remove_other_logos(project)
    ProjectLogo.where(project: project).each do |logo|
      logo.delete if logo != self
    end
  end
end
