class Message < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :body, presence: true, length: { in: 100..10000 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { in: 3..100 }
  validates :phone, presence: true
end
