# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment added successfully.'
    else
      redirect_to post_path(@post), alert: 'Error adding comment.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post), notice: 'Comment deleted successfully.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end


  
