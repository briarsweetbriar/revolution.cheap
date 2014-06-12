class UserAvatarSerializer < ActiveModel::Serializer
  attributes :id, :file

  has_one :user, serializer: UserSerializer
end
