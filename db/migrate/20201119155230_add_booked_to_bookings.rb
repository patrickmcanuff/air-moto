class AddBookedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booked, :string, :default => 'pending'
  end
end
