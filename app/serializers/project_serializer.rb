class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :title, :slug, :website, :source, :description

  has_one :project_logo, serializer: ProjectLogoSerializer
  has_one :slideshow, serializer: SlideshowSerializer
  has_many :project_roles, serializer: ProjectRoleSerializer
end
