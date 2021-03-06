class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource except: [:create, :update]


  # GET /articles
  # GET /articles.json
  def index
    if params[:tag].nil?
      if params[:my_article]
        #current_user.articles.not_published
        if current_user.articles.not_published.empty?
          @message = "Вы не предложили ни одной новости или их уже опубликовали"
        else
          @articles = current_user.articles.page params[:pages]
        end
      else  
        @articles = Article.published.page params[:page]
      end
    else
      @articles = Tag.find_by(tag: params[:tag]).articles.page params[:pages]
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @articles = Article.published.where.not(id: @article.id).limit(5)
    @liked = (!current_user.nil? && @article.marks.exists?(user_id: current_user.id)) ? "" : "grey" 
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article.tag_list = @article.tags.map { |i| i.tag }.join(" ")
    #binding.pry
   end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    authorize! :create, @article
    respond_to do |format|
      if @article.save
        tag_array = find_or_create_tags(params[:tags].map{|k, v| v}) unless params[:tags].empty? || params[:tags]["0"].empty?
        @article.tags << tag_array.compact unless tag_array.nil?
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    authorize! :make_publication, @article if params[:article][:published] == "1"
    #binding.pry
    respond_to do |format|
      if @article.update(article_params)
        old_tags = @article.tags.map { |i| i.tag }
        new_tags = params[:tags].map { |key, value| value }
        delete_tags(old_tags - new_tags)
        @article.tags << find_or_create_tags(new_tags - old_tags)
        #@article.tags << find_or_create_tags unless params[:tags].empty?
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    def find_or_create_tags tags
      tags.map do |value|
        Tag.find_or_create_by(tag: value) unless value.empty?
      end
    end

    def delete_tags tags
      tags.each do |tag|
        Tag.where(tag: tag).destroy_all
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :published, :illustration, :description)
    end
end
