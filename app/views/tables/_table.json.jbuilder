json.extract! table, :id, :table_number, :seating_capacity, :status, :created_at, :updated_at
json.url table_url(table, format: :json)
