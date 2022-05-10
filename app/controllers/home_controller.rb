class HomeController < ApplicationController
  before_action :move_to_signed_in

  def top
    @genres = Genre.all
    @categories = Category.all
    @contents = Content.order(updated_at: :desc).limit(3)
    @posts = Post.order(updated_at: :desc).limit(3)
  end

  private
  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
