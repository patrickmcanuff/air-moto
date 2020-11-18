class Booking < ApplicationRecord
  belongs_to :motorcycle
  belongs_to :user
  validates :date_start, presence: true
  validates :date_end, presence: true
end
