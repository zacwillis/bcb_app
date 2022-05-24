class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.integer :client_id
      t.string :name
      t.string :vin
      t.string :make
      t.string :year
      t.string :vehicle_type

      t.timestamps
    end
  end
end
