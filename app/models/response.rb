class Response < ApplicationRecord
  validates :content, presence: true, length: { minimum: 1 }

  belongs_to :comment
  belongs_to :user
end
