class ProjectRoleSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :website

  has_one :project, serializer: ProjectSerializer
  has_one :user, serializer: UserSerializer
end
