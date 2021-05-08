json.extract! image, :id, :title, :description, :price, :private, :url, :created_at, :updated_at
json.url image_url(image, format: :json)
