class ToppagesController < ApplicationController
    def index
      @articles = Article.all.order(id: :desc).page(params[:page])
    end
   
end
