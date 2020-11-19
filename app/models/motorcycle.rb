class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :model, presence: true
  validates :brand, presence: true
  validates :location, presence: true
  validates :year, presence: true
  validates :photos, presence: true


  include PgSearch::Model
  pg_search_scope :search_by_location,
                  against: [ :location ],
                  using: {
                      tsearch: { prefix: true }
                  }
end
