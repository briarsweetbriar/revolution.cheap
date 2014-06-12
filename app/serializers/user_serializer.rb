class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio

  has_one :user_avatar, serializer: UserAvatarSerializer
  has_many :posts, serializer: PostSerializer

end
