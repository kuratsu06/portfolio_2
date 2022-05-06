json.extract! content, :id, :user_id, :genre_id, :category_id, :title, :author, :created_at, :updated_at
json.url content_url(content, format: :json)
