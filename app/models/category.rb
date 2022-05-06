class Category < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :contents, dependent: :destroy
  has_many :posts, dependent: :destroy
end
