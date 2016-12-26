class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_article, only: [:create, :destroy]
  load_and_authorize_resource except: :create

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  def create
    #binding.pry
    @comment = Comment.new comment_params
    @comment.user = current_user
    @comment.article_id = params[:article_id]
    authorize! :create, @comment

    if @comment.save
      #redirect_to @article
      respond_to do |format|
        format.js {}
      end
    else
      redirect_to @article, notice: 'Комментарий не сохранён'
    end
  end

  def destroy
    #article = Article.find params[:article_id]
    @comment.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_article
      article_params = params.require(:article_id)
      @article = Article.find(article_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
