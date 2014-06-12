class ProjectRoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :website

  has_one :project, serializer: ProjectSerializer
  has_one :user, serializer: UserSerializer
end
