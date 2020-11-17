class AddCreditCardToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :credit_card_number, :integer
    add_column :bookings, :csv, :integer
  end
end
