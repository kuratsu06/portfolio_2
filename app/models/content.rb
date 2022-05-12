class Content < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :category
  has_many :posts, dependent: :destroy

  validates :user_id, presence: true
  validates :genre_id, presence: true
  validates :category_id, presence: true
  validates :title, presence: true, length: { in: 1..20 }
  validates :author, presence: true

  def self.search(search)
    if search
      Content.joins(:category).where(['title LIKE ? OR author LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Content.all
    end
  end
end
