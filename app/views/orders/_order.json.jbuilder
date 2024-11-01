json.extract! order, :id, :reservation_id, :order_date, :staff_id, :status, :total_amount, :created_at, :updated_at
json.url order_url(order, format: :json)
