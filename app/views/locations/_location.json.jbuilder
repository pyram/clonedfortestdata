json.extract! location, :id, :name, :info, :url, :job_id, :created_at, :updated_at
json.url location_url(location, format: :json)
