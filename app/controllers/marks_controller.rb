class MarksController < ApplicationController
  authorize_resource 

  def create
    article = Article.find params[:article_id]
    @mark = Mark.where(article_id: article.id, user_id: current_user.id).first || article.marks.new(user_id: current_user.id)
    if @mark.new_record?    
      @mark.save
      redirect_to article
    else 
      @mark.destroy
      redirect_to article
    end
  end
end
