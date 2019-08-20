class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cuties
  has_many :rentals
  validates :age, :numericality => { greater_than_or_equal_to: 18 }
  validates :age, numericality: { only_integer: true }
  mount_uploader :photo, PhotoUploader
end
