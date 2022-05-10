class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :content

  def self.search(search)
    if search
      Post.joins(:category, :content).where(['subtitle LIKE ? OR diary LIKE ? OR name LIKE ? OR title LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Post.all
    end
  end
end
