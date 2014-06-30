class ProjectRole < ActiveRecord::Base
  include ValidatorRegex
  
  belongs_to :project
  belongs_to :user

  validates :name, presence: true, length: { in: 3..30 }
  validates :title, presence: true, length: { in: 3..30 }
  validates :website, allow_blank: true, uri: { format: VALID_URI_REGEX }

  after_create :increment_user_projects_count
  after_destroy :decrement_user_projects_count

  private
  def increment_user_projects_count
    user.increment(:projects_count)
    user.save
  end

  def decrement_user_projects_count
    user.decrement(:projects_count)
    user.save
  end
end
