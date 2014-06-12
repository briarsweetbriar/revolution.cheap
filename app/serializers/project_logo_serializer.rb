class ProjectLogoSerializer < ActiveModel::Serializer
  attributes :id, :file

  has_one :project, serializer: ProjectSerializer
end
