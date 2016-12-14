class ResponsesController < ApplicationController
  before_action :set_comment

  def create
    @response = Response.new(response_params)
    @response.user = current_user
    if @response.save
      @comment.responses << @response
      redirect_to :back
    end
  end

  private
    def response_params
      params.require(:response).permit(:content)
    end

    def set_comment
      @comment = Comment.find params[:id]
    end
end
