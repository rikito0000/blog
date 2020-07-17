class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'ユーザ登録しました。'
      redirect_to article_path(article)
    else
     render :new
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
