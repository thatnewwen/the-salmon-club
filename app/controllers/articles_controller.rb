class ArticlesController < ApplicationController
	def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  	@article = Article.find(params[:id].to_i)
    @comments = @article.comments
  end

  def create
    @article = Article.new(article_params.merge(author_id: session[:user_id]))

    if @article.save
      redirect_to '/articles'
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @article = Article.find(params[:id].to_i)
    @article.destroy
    redirect_to '/articles'
  end

  private
    def article_params
      params.require(:article).permit(:title, :start_date, :end_date, :content)
    end
end
