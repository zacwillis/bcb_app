json.extract! job, :id, :client_id, :location_id, :vehicle_id, :source_id, :quantity, :start_date, :job_type, :status, :address, :price, :created_at, :updated_at
json.url job_url(job, format: :json)
