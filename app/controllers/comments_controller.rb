class CommentsController < ApplicationController
  def article_new
    authorize!
    @comment = Comment.new
  end

  def article_create
  	authorize!
    article = Article.find(params[:article_id])

  	@comment = article.comments.new(comment_params.merge(author_id: session[:user_id]))

  	if @comment.save
  	  redirect_to "/articles/#{params[:article_id]}"
  	else
  	  @errors = @comment.errors.full_messages
  	  render 'new'
  	end
  end

  def comment_new
    authorize!
    @comment = Comment.new
  end

  def comment_create
    authorize!
    comment = Comment.find(params[:comment_id])

    @comment = comment.comments.new(comment_params.merge(author_id: session[:user_id]))

    if @comment.save
      redirect_to "/articles/#{comment.commentable_id}"
    else
      @errors = @comment.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    redirect_to "/articles/#{params[:article_id]}"
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :content)
    end
end