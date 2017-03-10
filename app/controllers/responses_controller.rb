class ResponsesController < ApplicationController
  before_action :set_comment, :set_article
  before_action :set_response, only: [:update, :destroy, :edit]

  def new
    respond_to do |format|
      format.js {}
    end
  end
  
  def create
    @response = Response.new(response_params)
    @response.user = current_user

    if @response.save
      @comment.responses << @response
      respond_to do |format|
        format.js {}
      end
    end
  end

  def edit
  end

  def update 
    if @response.update(response_params)
      respond_to do |format| 
        format.js {}
      end
    end
  end

  def destroy 
    @response.destroy()
    respond_to do |format|
      format.js {}
    end
  end

  private
    def response_params
      params.require(:response).permit(:content)
    end

    def set_comment
      @comment = Comment.find params[:comment_id]
    end

    def set_article
      @article = Article.find params[:article_id]
    end

    def set_response
      @response = Response.find params[:id]
    end
end
