class TaggingSerializer < ActiveModel::Serializer
  attributes :id

  has_one :taggable, polymorphic: true
  has_one :tag, serializer: TagSerializer

end
