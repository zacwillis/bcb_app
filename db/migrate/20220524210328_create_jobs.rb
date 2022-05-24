class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.integer :client_id
      t.integer :location_id
      t.integer :vehicle_id
      t.integer :source_id
      t.integer :quantity
      t.datetime :start_date
      t.string :job_type
      t.string :status
      t.string :address
      t.string :price

      t.timestamps
    end
  end
end
