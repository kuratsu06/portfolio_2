class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :category
  belongs_to :content

  def self.search(search)
    if search
      Post.where(['subtitle LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
