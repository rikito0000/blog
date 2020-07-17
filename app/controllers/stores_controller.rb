class StoresController < ApplicationController
  before_action :require_user_logged_in
   
   def index
     @articles = current_user.store_this
   end

  def create
    article = Article.find(params[:article_id])
    current_user.store(article)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    article = Article.find(params[:article_id])
    current_user.dontstore(article)
    redirect_back(fallback_location: root_path)
  end
end
