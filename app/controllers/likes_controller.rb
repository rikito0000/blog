class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    article = Article.find(params[:article_id])
    current_user.like(article)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    article = Article.find(params[:article_id])
    current_user.dontlike(article)
    redirect_back(fallback_location: root_path)
  end
end