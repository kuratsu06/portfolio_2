class Genre < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :posts, dependent: :destroy
end
