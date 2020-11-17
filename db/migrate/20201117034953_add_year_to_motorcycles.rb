class AddYearToMotorcycles < ActiveRecord::Migration[6.0]
  def change
    add_column :motorcycles, :year, :integer
  end
end
