class AddPhotoToMotorcycles < ActiveRecord::Migration[6.0]
  def change
    add_column :motorcycles, :photo, :string
  end
end
