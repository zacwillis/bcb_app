class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.integer :client_id
      t.integer :source_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.boolean :accepts_sms

      t.timestamps
    end
  end
end
