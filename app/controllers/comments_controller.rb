class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    
    @micropost =  Micropost.find_by id: params[:micropost_id]
    @comment = @micropost.comments.build(comment_params)
    # @comment=current_user.comments.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to root_path

    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

   def comment_params
      params.require(:comment).permit(:content, :micropost_id, :user_id)
    end
end