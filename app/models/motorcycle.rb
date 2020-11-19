class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :model, presence: true
  validates :brand, presence: true
  validates :location, presence: true
  validates :year, presence: true
end
