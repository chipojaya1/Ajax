class CommentsController < ApplicationController
  # An action to save and post a comment.
  def create
    # Search Blog from the parameter value and build it as comments associated with Blog.
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog), notice: 'Couldn't post...' }
      end
    end
  end
  private
  # Strong parameters
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
