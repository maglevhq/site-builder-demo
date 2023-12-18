json.extract! user, :id, :email, :password_digest, :password_confirmation, :created_at, :updated_at
json.url user_url(user, format: :json)
