class RemoveCsvColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :csv
  end
end
