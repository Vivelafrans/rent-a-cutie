class Review < ApplicationRecord
  belongs_to :user
  belongs_to :rental

  validates :rating, :comment, presence: true
  validates :rating, numericality: { only_integer: true }
end
