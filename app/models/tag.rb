class Tag < ApplicationRecord
  validates :tag, presence: true, length: { minimum: 1 }
  has_and_belongs_to_many :articles
end
