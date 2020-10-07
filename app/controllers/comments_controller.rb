class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/taxis/#{comment.taxi.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, taxi_id: params[:taxi_id])
  end
end
