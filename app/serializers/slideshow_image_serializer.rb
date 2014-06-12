class SlideshowImageSerializer < ActiveModel::Serializer
  attributes :id, :file

  has_one :slideshow, serializer: SlideshowSerializer
end
