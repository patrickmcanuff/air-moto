class CreateMotorcycles < ActiveRecord::Migration[6.0]
  def change
    create_table :motorcycles do |t|
      t.string :model
      t.string :brand
      t.string :type
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
