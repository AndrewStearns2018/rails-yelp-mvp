class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # dependent :destroy means that if we detroy a Restaurant instance
  # we also destroy the corresponding reviews.
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
