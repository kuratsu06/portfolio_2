class Genre < ApplicationRecord
  has_many :categories, dependent: :destroy
end
