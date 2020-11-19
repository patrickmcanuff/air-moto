class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :model, presence: true
  validates :brand, presence: true
  validates :location, presence: true
  validates :year, presence: true

  include PgSearch::Model
  # multisearchable (
  #   against: [:location],
  #     additional_attributes: -> (motorcycle) {{booking_id: }}
  # )
  pg_search_scope :search_by_location,
                  against: [ :location ],
                  associated_against: {
                      bookings: [:date_start, :date_end]
                  },
                  using: {
                      tsearch: { prefix: true }
                  }
end

