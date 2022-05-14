class PostsController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_post, only: %i(show edit update destroy)
  before_action :side_bar, only: %i(index new show)

  # GET /posts or /posts.json
  def index
    @posts = Post.search(params[:search]).where(user_id: current_user.id).order(updated_at: :desc)
    @categories = Category.where(genre_id: @genres.ids)
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @category = Category.find(params[:category_id])
    @content = Content.find(params[:content_id])
    @content_title = params[:content_title]
  end

  # GET /posts/1/edit
  def edit
    @genres = Genre.all
    @category = Category.find(params[:category_id])
    @content = Content.find(params[:content_id])
    @content_title = params[:content_title]
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @category = Category.find(params[:post][:category_id])
    @content = Content.find(params[:post][:content_id])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "日記を登録しました" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "日記を更新しました" }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "日記を削除しました" }
      format.json { head :no_content }
    end
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def side_bar
    @genres = Genre.all
    @category = Category.all
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:user_id, :category_id, :content_id, :subtitle, :diary)
  end
end
