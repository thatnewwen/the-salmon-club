class CommentsController < ApplicationController
  def discussion_new
    authorize!
    @comment = Comment.new

    if request.xhr?
      render 'discussion_new', layout: false
    end
  end

  def discussion_create
    p "test"
  	authorize!
    @discussion = Discussion.find(params[:discussion_id])

  	@comment = @discussion.comments.new(comment_params.merge(author_id: session[:user_id]))


    if request.xhr?
      if @comment.save
        render 'show', layout: false
      end
    else
    	if @comment.save
    	  redirect_to "/articles/#{discussion.article.id}"
    	else
    	  @errors = @comment.errors.full_messages
    	  render 'new'
    	end
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

    discussion = Discussion.find(comment.commentable_id)

    if @comment.save
      redirect_to "/articles/#{discussion.article.id}"
    else
      @errors = @comment.errors.full_messages
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @discussion_id = params[:discussion_id]
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    discussion = Discussion.find(@comment.commentable_id)
    @article = discussion.article

    if @comment.save
      redirect_to "/articles/#{@article.id}"
    else
      @errors = @comment.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    discussion = Discussion.find(@comment.commentable_id)

    @comment.destroy
    redirect_to "/articles/#{discussion.article.id}"
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end