class ProjectRole < ActiveRecord::Base
  include ValidatorRegex
  
  belongs_to :project
  belongs_to :user

  validates :name, presence: true, length: { in: 3..30 }
  validates :title, presence: true, length: { in: 3..30 }
  validates :website, allow_blank: true, uri: { format: VALID_URI_REGEX }
end
