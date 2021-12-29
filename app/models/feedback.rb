class Feedback < ApplicationRecord
  belongs_to :company

  validates :body, presence: true, length: { minimum: 10 }
end
