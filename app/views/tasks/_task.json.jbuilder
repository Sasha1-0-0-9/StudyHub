json.extract! task, :id, :title, :description, :price, :created_at, :updated_at
json.url task_url(task, format: :json)
