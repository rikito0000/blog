class ArticlesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :destroy, :update]
  
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
  end
  
  def new 
    @article = current_user.articles.build
  end
  
  def create
    @article = current_user.articles.build(article_params)
    if@article.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = '更新しました'
      redirect_to article_path(@article)
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @article.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to root_url
  end
  
  
  private

  def article_params
    params.require(:article).permit(:content, :title, :img)
  end
  
  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    unless @article
      redirect_to root_url
    end
  end
end
