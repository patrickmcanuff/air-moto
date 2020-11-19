class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :model, presence: true
  validates :brand, presence: true
  validates :location, presence: true
  validates :year, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_location,
                  against: [ :location ],
                  using: {
                      tsearch: { prefix: true }
                  }
end
