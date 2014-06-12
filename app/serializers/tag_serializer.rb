class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :projects_count, :posts_count

  has_many :projects, serializer: ProjectSerializer
  has_many :posts, serializer: PostSerializer

end
