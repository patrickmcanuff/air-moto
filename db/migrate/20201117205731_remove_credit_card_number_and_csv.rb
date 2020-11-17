class RemoveCreditCardNumberAndCsv < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :credit_card_number, :csv
  end
end
