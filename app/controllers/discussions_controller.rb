class DiscussionsController < ApplicationController
  def new
    authorize!
    @discussion = Discussion.new
  end

  def create
    authorize!
    article = Article.find(params[:article_id])

    @discussion = article.discussions.new(discussion_params)

    if @discussion.save
      redirect_to "/articles/#{params[:article_id]}"
    else
  	  @errors = @comment.errors.full_messages
  	  render 'new'
  	end
  end

  def show
  	@discussion = Discussion.find(params[:id])
  	@comments = @discussion.comments

    if request.xhr?
      render 'show', layout: false
    end
  end

  def edit
    @discussion = Discussion.find(params[:id].to_i)
  end

  def update
    @discussion = Discussion.find(params[:id].to_i)

    @discussion.update_attributes(discussion_params)

    if @discussion.save
      redirect_to "/discussions/#{@discussion.id}"
    else
      @errors = @discussion.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id].to_i)
    @discussion.destroy
    redirect_to '/articles'
  end
  
  private
    def discussion_params
    	params.require(:discussion).permit(:description, :start_date)
    end
end