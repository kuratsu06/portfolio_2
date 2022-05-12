class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :content

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :content_id, presence: true
  validates :subtitle, presence: true, length: { in: 1..20 }
  validates :diary, presence: true, length: { maximum: 5000 }

  def self.search(search)
    if search
      Post.joins(:category, :content).where(['subtitle LIKE ? OR diary LIKE ? OR name LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Post.all
    end
  end
end
