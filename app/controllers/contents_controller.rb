class ContentsController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_content, only: %i[ show edit update destroy ]
  before_action :side_bar, only: %i[ index new edit ]

  # GET /contents or /contents.json
  def index
    @contents = Content.search(params[:search])
  end

  # GET /contents/1 or /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
    @genre = Genre.find(params[:genre_id])
    @categories = Category.where(genre_id: @genre.id)
  end

  # GET /contents/1/edit
  def edit
    @genre = Genre.find(params[:genre_id])
    @categories = Category.where(genre_id: @genre.id)
  end

  # POST /contents or /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to contents_url(@content), notice: "Content was successfully created." }
        format.json { render :index, status: :created, location: @content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1 or /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to contents_url(@content), notice: "Content was successfully updated." }
        format.json { render :index, status: :ok, location: @content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1 or /contents/1.json
  def destroy
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url, notice: "Content was successfully destroyed." }
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
    def set_content
      @content = Content.find(params[:id])
    end

    def side_bar
      @genres = Genre.all
      @category = Category.all
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:user_id, :genre_id, :category_id, :title, :author)
    end
end
