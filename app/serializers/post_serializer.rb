class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :slug

  has_one :user, serializer: UserSerializer
  has_many :tags, serializer: TagSerializer

end
