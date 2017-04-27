json.extract! job_location, :id, :name, :info, :url, :created_at, :updated_at
json.url job_location_url(job_location, format: :json)
