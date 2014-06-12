class SlideshowSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_one :slideshowable, polymorphic: true
  has_many :slideshow_images, serializer: SlideshowImageSerializer
end
