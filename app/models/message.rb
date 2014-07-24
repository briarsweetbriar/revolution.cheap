class Message < ActiveRecord::Base
  include ValidatorRegex

  validates :body, presence: true, length: { in: 100..10000 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { in: 3..100 }
  validates :phone, presence: true
end
