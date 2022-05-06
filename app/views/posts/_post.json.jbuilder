json.extract! post, :id, :user_id, :genre_id, :category_id, :content_id, :subtitle, :diary, :created_at, :updated_at
json.url post_url(post, format: :json)
