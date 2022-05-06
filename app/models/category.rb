class Category < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :contents, dependent: :destroy
  has_many :posts, dependent: :destroy

  def self.search(search)
    if search
      Category.where(['name LIKE ?', "%#{search}%"])
    else
      Category.all
    end
  end
end
