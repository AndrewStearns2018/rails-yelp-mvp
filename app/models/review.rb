class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  # This is tricky. In the column en-tête we say that the rating is an integer
  # but this basically just calles to_i on a string, which will return 0.
  # Alors, in the validations, we validate the 'numericality'.
end
