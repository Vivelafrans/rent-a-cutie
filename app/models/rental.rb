class Rental < ApplicationRecord
  belongs_to :cutie
  belongs_to :user
  validates :start_date, :end_date, presence: true
end
