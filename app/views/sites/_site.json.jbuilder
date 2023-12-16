json.extract! site, :id, :name, :domain, :content, :created_at, :updated_at
json.url site_url(site, format: :json)
