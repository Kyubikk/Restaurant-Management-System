json.extract! reservation, :id, :customer_id, :reservation_date, :number_of_guests, :table_id, :status, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
