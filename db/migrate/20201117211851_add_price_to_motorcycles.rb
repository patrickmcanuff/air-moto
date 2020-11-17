class AddPriceToMotorcycles < ActiveRecord::Migration[6.0]
  def change
    add_column :motorcycles, :price, :integer
  end
end
