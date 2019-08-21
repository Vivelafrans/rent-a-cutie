class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :owned_cuties, class_name: "Cutie"
  has_many :rentals
  has_many :rented_cuties, through: :rentals, source: :cutie
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :age, numericality: { only_integer: true }
  mount_uploader :photo, PhotoUploader

  #Display the cuti-rental-requests to an owner
  def owner_rent_out
    cuties = []
    Rental.all.each do |r|
      temp_arr = []
      if r.cutie.user == self
        temp_arr[0] = r.cutie
        temp_arr[1] = r
        cuties << temp_arr
      end
    end
    return cuties
  end

  #Display the cuties which a user requested to rent
  def renter_rent
    cuties = []
    Rental.all.each do |r|
      temp_arr = []
      if r.user == self
        temp_arr[0] = r.cutie
        temp_arr[1] = r
        cuties << temp_arr
      end
    end
    return cuties
  end
end
