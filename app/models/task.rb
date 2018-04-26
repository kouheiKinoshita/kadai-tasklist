class Task < ApplicationRecord
  validates :content, presence: true, length: {maximum: 255}
  validates :status, presence: true, length: {minimum: 0}
end
