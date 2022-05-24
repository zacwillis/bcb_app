json.extract! customer, :id, :client_id, :source_id, :first_name, :last_name, :email, :phone, :accepts_sms, :created_at, :updated_at
json.url customer_url(customer, format: :json)
