class CommentsController < ApplicationController

  # get our user comments
  def index
    @photo_comments = Comment.where(photo_id: params[:photo_id])
  end

  # post the user comments
  def create
    @comment = Comment.create(photo_id: params[:photo_id], user_id: params[:user_id], context: params[:comment][:context])
    flash[:notice] = "You successfully added a comment"
    redirect_to :back
  end
end
