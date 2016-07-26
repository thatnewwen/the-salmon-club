class ArticlesController < ApplicationController
	def index
    articles = Article.all
    @articles = articles.sort {|a,b| b.created_at <=> a.created_at}
  end

  def new
    @article = Article.new
  end

  def show
  	@article = Article.find(params[:id].to_i)
    @comments = @article.comments
    @discussions = @article.discussions.sort {|a,b| a.created_at <=> b.created_at}

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

  def edit
    @article = Article.find(params[:id].to_i)
  end

  def update
    @article = Article.find(params[:id].to_i)

    @article.update_attributes(article_params)

    if @article.save
      redirect_to "/articles/#{@article.id}"
    else
      @errors = @article.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id].to_i)
    @article.destroy
    redirect_to '/articles'
  end

  private
    def article_params
      params.require(:article).permit(:title, :start_date, :end_date, :content, :readings, :sub_title)
    end
end
