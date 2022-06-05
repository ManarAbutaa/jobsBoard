json.extract! job, :id, :Job_title, :Job_description, :Requirements, :Time, :Level, :created_at, :updated_at
json.url job_url(job, format: :json)
