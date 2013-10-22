class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Your article has been posted."
      flash.keep :notice
      render js: "window.location = '#{admin_url}'"
    else
      respond_to do |format|
        format.js 
      end
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "#{@article.title} was just eradicated."
    redirect_to articles_path
  end

  def edit
    
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
