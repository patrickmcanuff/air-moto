class RemoveTypeFromMotorcycles < ActiveRecord::Migration[6.0]
  def change
    remove_column :motorcycles, :type, :string
  end
end
