json.extract! company, :id, :company_name, :street_address, :postal_code, :city, :country, :created_at, :updated_at
json.url company_url(company, format: :json)
