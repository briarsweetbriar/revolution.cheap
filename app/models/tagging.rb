class Tagging < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  belongs_to :tag

  validates :tag, uniqueness: { scope: :taggable }

  after_create { tag.increment!(counter_type) }
  after_destroy { tag.increment!(counter_type) }

  private
  def counter_type
    "#{ taggable_type.underscore.pluralize }_count".to_sym
  end
end
