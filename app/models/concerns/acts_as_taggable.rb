module ActsAsTaggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings

    accepts_nested_attributes_for :taggings, allow_destroy: true
  end
end