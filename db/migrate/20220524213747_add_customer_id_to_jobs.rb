class AddCustomerIdToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :customer_id, :integer
  end
end
