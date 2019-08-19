class Cutie < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :ad_title, :name, :animal_type, :age, :gender, :hourly_price, presence: true
  validates :ad_title, uniqueness: true
end
