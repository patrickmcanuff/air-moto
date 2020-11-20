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
  scope :search_by_date, -> (date_start, date_end) {
    where.not(
        id: Booking.where('date_start <= ? AND date_end >= ?', date_start, date_end).map(&:motorcycle_id)
    )
  }
  scope :search_by_location_and_date, -> (location, date_start, date_end) {
    search_by_location(location)
        .search_by_date(date_start, date_end)
  }
end

