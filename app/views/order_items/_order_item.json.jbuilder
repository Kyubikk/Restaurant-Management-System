json.extract! order_item, :id, :order_id, :menu_item_id, :staff_id, :quantity, :price, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
