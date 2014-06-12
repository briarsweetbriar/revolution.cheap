class Slideshow < ActiveRecord::Base
  belongs_to :slideshowable, polymorphic: true
  has_many :slideshow_images, dependent: :destroy

  validates :slideshowable, presence: true
  validates :title, presence: true, length: { in: 3..120 }
end
