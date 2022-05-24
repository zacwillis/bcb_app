json.extract! vehicle, :id, :client_id, :name, :vin, :make, :year, :vehicle_type, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
