class SlideshowImage < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  belongs_to :slideshow

  validates :file, presence: true
end
