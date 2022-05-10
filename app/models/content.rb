class Content < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :category
  has_many :posts, dependent: :destroy

  def self.search(search)
    if search
      Content.joins(:category).where(['title LIKE ? OR author LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Content.all
    end
  end
end
