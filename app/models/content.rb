class Content < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :category
end
