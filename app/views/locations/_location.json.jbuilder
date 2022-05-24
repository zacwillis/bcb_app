json.extract! location, :id, :client_id, :name, :street, :city, :state, :zip, :created_at, :updated_at
json.url location_url(location, format: :json)
