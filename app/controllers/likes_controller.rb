class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    article = Article.find(params[:article_id])
    current_user.like(article)
    flash[:success] = '投稿をお気に入りにしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    article = Article.find(params[:article_id])
    current_user.dontlike(article)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end