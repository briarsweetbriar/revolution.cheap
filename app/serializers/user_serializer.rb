class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :slug, :github, :website, :projects_count, :posts_count

  has_one :user_avatar, serializer: UserAvatarSerializer
  has_many :posts, serializer: PostSerializer

end
