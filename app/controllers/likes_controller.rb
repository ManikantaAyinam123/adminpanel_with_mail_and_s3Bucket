class LikesController < ApplicationController
  def index
    # Your code for the 'index' action goes here
    create
  end

  def create
    if params[:post_id]
      toggle_like(Post.find(params[:post_id]))
    elsif params[:comment_id]
      toggle_like(Comment.find(params[:comment_id]))
    else
      redirect_back(fallback_location: root_path, alert: 'Invalid like request.')
    end
  end

  private

  def toggle_like(item)
    existing_like = item.likes.find_by(user: current_user)

    if existing_like
      existing_like.destroy
    else
      item.likes.create(user: current_user)
    end

    redirect_back(fallback_location: root_path)
  end
end



  
