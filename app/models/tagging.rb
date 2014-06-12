class Tagging < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  belongs_to :tag

  validates :tag, uniqueness: { scope: :taggable }

  after_create :increment_tagging_count
  after_destroy :decrement_tagging_count

  private
  def counter_type
    "#{ taggable_type.underscore.pluralize }_count".to_sym
  end

  def increment_tagging_count
    tag.increment(counter_type)
  end

  def decrement_tagging_count
    tag.decrement(counter_type)
  end
end
