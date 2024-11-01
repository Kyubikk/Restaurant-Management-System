json.extract! feedback, :id, :customer_id, :rating, :comments, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
