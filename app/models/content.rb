class Content < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :category
  has_many :posts, dependent: :destroy

  def self.search(search)
    if search
      Content.where(['title LIKE ?', "%#{search}%"])
    else
      Content.all
    end
  end
end
