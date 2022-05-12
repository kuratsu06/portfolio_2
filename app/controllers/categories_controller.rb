class CategoriesController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_category, only: %i(show edit update destroy)
  before_action :side_bar, only: %i(index new)

  # GET /categories or /categories.json
  def index
    @categories = Category.search(params[:search]).order(updated_at: :desc)
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
    @genre = Genre.all
  end

  # GET /categories/1/edit
  def edit
    @genres = Genre.all
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: "カテゴリを登録しました" }
        format.json { render :index, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url(@category), notice: "カテゴリを更新しました" }
        format.json { render :index, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "カテゴリを削除しました" }
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
  def set_category
    @category = Category.find(params[:id])
  end

  def side_bar
    @genres = Genre.all
    @category = Category.all
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:user_id, :genre_id, :name)
  end
end
