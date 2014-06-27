module ActsAsTaggable
  extend ActiveSupport::Concern
  attr_accessor :tag_names

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings

    accepts_nested_attributes_for :taggings, allow_destroy: true
    
    before_save :set_tags
  end

  private
  def set_tags
    if @tag_names
      self.tags = @tag_names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
      end
    end
  end
end