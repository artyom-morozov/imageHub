json.extract! cart, :id, :id, :order_date, :total, :description, :ship_date, :created_at, :updated_at
json.url cart_url(cart, format: :json)
