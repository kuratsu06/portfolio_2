class HomeController < ApplicationController
  def top
    @genres = Genre.all
    @categories = Category.all
    @contents = Content.order(updated_at: :desc).limit(3)
    @posts = Post.order(updated_at: :desc).limit(3)
  end
end
