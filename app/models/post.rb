class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :category
  belongs_to :content
end
