json.extract! nonprofit, :id, :name, :category, :mission, :contact_name, :contact_email, :contact_phone, :owner_user_id, :status, :notes, :created_at, :updated_at
json.url nonprofit_url(nonprofit, format: :json)
